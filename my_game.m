function my_game()
close all
%% data
pt = 100;
colorlist = {'white'};  
shapelist = {'circle'};
skilllist = {'no skill'};
difficulty = 1;
msg1 = msgbox('Wellcome to my game ''BB''!','Hello');
waitfor(msg1)
%% menu selection
while 1
    selectionlist0 = {'Start','Shop','Bag','Setting'};
    [selection,quit] = listdlg('PromptString','What are you going to do?',...
        'SelectionMode','single',...
        'OKString','Go!',...
        'CancelString','Quit',...
        'ListString',selectionlist0);
    % quit game
    if ~quit
        msg8 = msgbox('See you!');
        waitfor(msg8)
        break
    end
    switch selection
        % start
        case 1
            % select color,shape,skill
            [color,shape,skill] = startselect(colorlist,shapelist,skilllist);
            % back to menu if color = 0
            % else we start the game
            if color ~=0
            [pt,colorlist] = startgame(color,shape,skill,pt,colorlist,difficulty);
            end
        % shop
        case 2
            % use pt to buy shapes and skills
           [pt,shapelist,skilllist] = shopselect(pt,shapelist,skilllist);%
        % bag
        case 3
            % show a list of owned pt, colors, shapes and skills
            mybag(pt,colorlist,shapelist,skilllist)
        % setting
        case 4
            % change difficulty
            difficulty = setting(difficulty);
    end
end