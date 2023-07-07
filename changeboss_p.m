function [xb,yb,bosspcount] = changeboss_p(boss_hp,bosspcount,atk,xb,yb,axis_limit)
    % change the position of the boss as long as it is attacked
    % 'bosspcount' counts the change of position of the boss
    if boss_hp <= (15 - atk) && bosspcount == 0
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([1,round(axis_limit/2)]);
        bosspcount = 1;
    elseif boss_hp <= (15 - 2*atk) && bosspcount == 1
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([round(axis_limit/2),14]);
        bosspcount = 2;
    elseif boss_hp <= (15 - 3*atk) && bosspcount == 2
        xb = randi([round(axis_limit/2),14]);
        yb = randi([1,round(axis_limit/2)]);
        bosspcount = 3;
    elseif boss_hp <= (15 - 4*atk) && bosspcount == 3
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([round(axis_limit/2),14]);
        bosspcount = 4;
    elseif boss_hp <= (15 - 5*atk) && bosspcount == 4
        xb = randi([round(axis_limit/2),14]);
        yb = randi([1,round(axis_limit/2)]);
        bosspcount = 5;
    elseif boss_hp <= (15 - 6*atk) && bosspcount == 5  
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([1,round(axis_limit/2)]);
        bosspcount = 6;
    elseif boss_hp <= (15 - 7*atk) && bosspcount == 6
        xb = randi([round(axis_limit/2),14]);
        yb = randi([round(axis_limit/2),14]);
        bosspcount = 7;
    elseif boss_hp <= (15 - 8*atk) && bosspcount == 7  
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([1,round(axis_limit/2)]);
        bosspcount = 8;
    elseif boss_hp <= (15 - 9*atk) && bosspcount == 8
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([round(axis_limit/2),14]); 
        bosspcount = 9;
    elseif boss_hp <= (15 - 10*atk) && bosspcount == 9
        xb = randi([round(axis_limit/2),14]);
        yb = randi([round(axis_limit/2),14]);   
        bosspcount = 10;
    elseif boss_hp <= (15 - 11*atk) && bosspcount == 10
        xb = randi([round(axis_limit/2),14]);
        yb = randi([round(axis_limit/2),14]);   
        bosspcount = 11;
    elseif boss_hp <= (15 - 12*atk) && bosspcount == 11
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([1,round(axis_limit/2)]);  
        bosspcount = 12;
    elseif boss_hp <= (15 - 13*atk) && bosspcount == 12
        xb = randi([round(axis_limit/2),14]);
        yb= randi([1,round(axis_limit/2)]);   
        bosspcount = 13;
    elseif boss_hp <= (15 - 14*atk) && bosspcount == 13
        xb = randi([1,round(axis_limit/2)]);
        yb = randi([round(axis_limit/2),14]);  
        bosspcount = 14;
    end
        
end
