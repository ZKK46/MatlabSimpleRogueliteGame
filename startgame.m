function [pt,colorlist] = startgame(color,shape,skill,pt,colorlist,difficulty)
%% basic data
% apply difficulty
switch difficulty
    case 1
        boss_atk_speed = 0.5;
        hp = 5;
        atk = 3;
        getpt = 3;
    case 2
        boss_atk_speed = 0.65;
        hp = 3;
        atk = 2;
        getpt = 4;
    case 3            
        boss_atk_speed = 0.75;
        hp = 3;
        atk = 1;
        getpt = 5;
    case 4
        boss_atk_speed = 0.9;
        hp = 3;
        atk = 1;
        getpt = 7;
end
% default data
boss_atk_frequency = 5;
boss_atk = 1;
boss_atk_num = 0;
boss_atk_trace = 0;
timelaspe = 0.2;
boss_hp = 15;
% original position of boss attack(out of the screen)
xa = 30; 
ya = 30;
startatk = 0;
axis_limit = 15;
d = randi([1,4]); % random original direction
% original boss position
xb = randi([round(axis_limit/2),14]);
yb = randi([round(axis_limit/2),14]);
% original palyer position
x = randi([1,round(axis_limit/2)]);
y = randi([1,round(axis_limit/2)]);
ex = 0; %use ex to exit game
bosspcount = 0; % count for boss position change
% apply skill
switch skill
    case 'HP+3'
        hp = hp + 3;
    case 'ATK+1'
        atk = atk + 1;
    case 'speed up'
        timelaspe = 0.15;
        % keep the bullet speed unchanged
        boss_atk_speed = boss_atk_speed/0.2*timelaspe;
end
% generate random boss color
bosscolor = randi([1,6]);
switch bosscolor
    case 1
        bosscolor = 'yellow';
    case 2
        bosscolor = 'magenta';
    case 3
        bosscolor = 'cyan';
    case 4
        bosscolor = 'red';
    case 5
        bosscolor = 'green';
    case 6
        bosscolor = 'blue';
end
%% plot origin graph
% find shape and color
if strcmp(shape,'circle') == 1
    colorshape = strcat(color(1),'o');
else
    colorshape = strcat(color(1),shape(1));
end
draw_you(x,y,colorshape,bosscolor,axis_limit,boss_hp,hp,xa,ya,xb,yb,atk)
%% data to plot the following graph
% player's action
figure('KeyPressFcn',@my_callback);
    function my_callback(~,event) %callback function for movement
        switch event.Character
            case 'q'
                ex=1;
            case 30               
                d = 1; %up
            case 31
                d = 2; %down 
            case 29
                d = 3; %right
            case 28
                d = 4; %left 
            case 32
                startatk = 1; % press space bar to attack
        end
    end
%% use while to keep the figure changing step by step
% keep the game if player dont press 'q' or hp of boss and hp of player are
% not 0
while ex == 0 && boss_hp > 0 && hp > 0 
    % new position of player
    switch d
        case 1
            y = y+1; %up
        case 2
            y = y-1; %down
        case 3
            x = x+1; %right
        case 4
            x = x-1; %left
    end
    % set bound
    if x > axis_limit
        x = axis_limit;
    elseif x < 0
        x = 0;
    end
    
    if y > axis_limit
        y = axis_limit;
    elseif y < 0
        y = 0;
    end
    % new position of the bullet
    [boss_atk_num,boss_atk_trace,x,y,xa,ya] = ...
        boss_atk_func(boss_atk_num,boss_atk_trace,boss_atk_frequency,x,y,xa,ya,boss_atk_speed);
    % new position of the boss
    [xb,yb,bosspcount] = changeboss_p(boss_hp,bosspcount,atk,xb,yb,axis_limit);
    
    % plot new figure
    draw_you(x,y,colorshape,bosscolor,axis_limit,boss_hp,hp,xa,ya,xb,yb,atk)
    
    % player atk boss, hp of boss decrease
    % if player reach the boss and press space bar
    if startatk == 1 && (any(x == [xb,xb+1]) && any(y == [yb,yb+1]))
        boss_hp = boss_hp - atk;
        startatk = 0;
    end
    % boss atk player, hp of player decrease
    % if the bullet is close enough to player
    if ((x-0.3< xa && xa < x+0.3) && (y-0.3< ya && ya < y+0.3)) || (x-xa)^2+(y-ya)^2 <0.09
        hp = hp - boss_atk;
    end
    % pause before plot a new figure
    pause(timelaspe)
end

%% end of the game(stop the while loop)
% player press quit, back to menu
if ex == 1
    close all
    return
% player defeat the boss, player will won the color of boss
elseif boss_hp <= 0
    % check if player has the color of boss
    repeatcolor = 0;
    for i = 1:length(colorlist)
        if strcmp(bosscolor,colorlist{i}) == 1
            repeatcolor = repeatcolor + 1;
        end
    end
    % player haven't had the color of boss
    % add new color to colorlist and add pt
    if repeatcolor == 0
        colorlist(end+1) = {bosscolor};
        pt = pt + getpt;
        promptwin = sprintf('Boss HP = 0!You won!You get %dpt and new color %s!',getpt,bosscolor);
        msgwin = msgbox(promptwin);
        waitfor(msgwin)
        close all
    % if player have had the color of the boss
    % player will get an extra pt for repeated color
    else
        pt = pt + getpt + 1;
        promptwin = sprintf('Boss HP = 0!You won!You get %dpt plus 1 extra pt for collected color!',getpt);
        msgwin = msgbox(promptwin);
        waitfor(msgwin)
        close all
    end
% player loss
elseif hp <= 0
    msgloss = msgbox('Try next time!You can practice by choosing easier boss!');
    waitfor(msgloss)
    close all
end
end
%% function used to plot the figure
function draw_you(x,y,colorshape,bosscolor,axis_limit,boss_hp,hp,xa,ya,xb,yb,atk)
    % plot player and bullet
    plot(x,y,colorshape,xa,ya,strcat(bosscolor(1),'*'))
    axis([0,axis_limit,0,axis_limit])
    hold on
    %plot boss
    xboss = [xb xb+1 xb+1 xb];
    yboss = [yb yb yb+1 yb+1];
    patch(xboss,yboss,bosscolor(1))
    %show hp of boss and hp of player
    msghp = sprintf('HP of boss:%d HP of you:%d',boss_hp,hp);
    msgatk = sprintf('Bullet atk: 1 Your atk: %d',atk);
    title({msghp,msgatk})
    set(gca,'Color','k') % black background
    axis([0,axis_limit,0,axis_limit])
    hold off
end
