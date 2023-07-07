function [boss_atk_num,boss_atk_trace,x,y,xa,ya] = ...
    boss_atk_func(boss_atk_num,boss_atk_trace,boss_atk_frequency,x,y,xa,ya,boss_atk_speed)

 if boss_atk_trace == 40 %elliminate bullet if it runs 40 times
    boss_atk_num = 0; 
    boss_atk_trace = 0;
    % put it to somewhere invisible(out of the screen)
    xa = 30;
    ya = 30; 
 end
% it is possible to generate a new bullet only if there is no bullet
if boss_atk_num == 0 
    boss_atk_const = randi([1,boss_atk_frequency]);% atk or not
        % randomly generate new bullet
        if boss_atk_const == 1
            boss_atk_num = boss_atk_num + 1;
            % generate possition of the bullet
            xa = randi([2,14]);
            ya = randi([2,14]);
        end
        
else % if there is a bullet, let it move to you
    % cahsing system
    if (abs(x - xa) > abs(y - ya)) == 1
        xa = xa + (sign(x - xa))*boss_atk_speed;
    elseif (abs(x - xa) < abs(y - ya)) == 1
        ya = ya + (sign(y - ya))*boss_atk_speed;
    % bullet will stop when it is diagonal to player
    end
    % count the trace of bullet
    boss_atk_trace = boss_atk_trace + 1;
end
end
