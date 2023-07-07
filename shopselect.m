function [pt,shapelist,skilllist] = shopselect(pt,shapelist,skilllist)
%% shop menu
promptnumpt = sprintf('Now you have %d pt,choose what you like to buy!',pt);
msgnum = msgbox(promptnumpt);
waitfor(msgnum)
        [selection,ok] = listdlg('PromptString','I want to unlock more...',...
        'SelectionMode','single',...
        'OKString','Next',...
        'CancelString','back',...
        'ListString',{'Shapes','Skills'});
    % back to menu if player selects nothing
    if ~ok
        return
    end
    %% select shape to buy
    if selection == 1
        shopshapelist = {'Square(3pt)','Diamond(3pt)','Pentagram(3pt)','Hexagram(3pt)','Random(2pt)'};
            [shape,ok] = listdlg('PromptString','Which shape?',...
            'SelectionMode','single',...
            'OKString','ok',...
            'CancelString','back',...
            'ListString',shopshapelist);
        % back to menu
        if ~ok
            return
        end
        shapekey = 0; % set shapekey to 0 for the random selection below
        % pt is not enough
        if (pt-3) < 0
            msg3 = msgbox('Sorry, you don''t have enough pt!! Please defeat more boss!');
            waitfor(msg3)
            return
        % pt is enough
        else
            % transfer  shape selection to string
            switch shape
                case 1
                    shape = 'square';
                case 2
                    shape = 'diamond';
                case 3
                    shape = 'pentagram';
                case 4
                    shape = 'hexagram';
                case 5
                    shapekey = randi(4); % pick a shape randomly
                    switch shapekey
                        case 1
                            shape = 'square';
                        case 2
                            shape = 'diamond';
                        case 3
                            shape = 'pentagram';
                        case 4
                            shape = 'hexagram';   
                    end
            end
            % check repeated shape 
            repeatshape = 0;
            for i = 1:length(shapelist)
                if strcmp(shape,shapelist{i}) == 1
                    repeatshape = repeatshape + 1;
                end
            end
            % if there's no repeated shape
            if repeatshape == 0
                if shapekey == 0 % player don' chose random
                    pt = pt - 3;
                else 
                    pt = pt - 2; % player chose random(2pt)
                end
                % add new shape to shapelist and back to menu
                shapelist(end+1) = {shape};
                promptnumpt = sprintf('Now you have %d pt and get a new shape "%s"! Let''s try it in fight~',pt,shape);
                msgnum = msgbox(promptnumpt);
                waitfor(msgnum)
                return
            % if there is a repeated shape
            else
                % player chose random, then player lost 2pt 
                % back to menu
                if shapekey ~= 0 
                    pt = pt - 2;
                    promptre1 = sprintf('You spent 2pt and drew a random shape "%s", but you have already had this shape...',shape);
                    promptre2 = sprintf('Now you have %dpt. Better luck next time!',pt);
                    msgrepeat = msgbox({promptre1,promptre2});
                    waitfor(msgrepeat)
                    return
                % player didn't choose random, pt does not change
                % back to menu
                else
                    msgrepeat = msgbox('You can not buy one shape twice!');
                    waitfor(msgrepeat)
                    return
                end
            end
        end
    %select skill
    else
    shopskilllist = {'HP+3 (5pt)','ATK+1 (5pt)','speed up (5pt)'};
    [skill,ok] = listdlg('PromptString','which skill?',...
        'SelectionMode','single',...
        'OKString','ok',...
        'CancelString','back',...
        'ListString',shopskilllist);
    % if player select nothing, back to menu
    if ~ok
        return
    end
    % if pt is not enough, back to menu
    if (pt-5)<0
        msgpt = msgbox('Sorry, you don''t have enough pt!!please defeat more boss!');
        waitfor(msgpt)
        return
    % if pt is enough
    else
        switch skill
            case 1
                skill = 'HP+3';
            case 2
                skill = 'ATK+1';
            case 3
                skill = 'speed up';
        end
        % check repeated skill
        repeatskill = 0;
        for i = 1:length(skilllist)
            if strcmp(skill,skilllist{i}) == 1
                repeatskill = repeatskill + 1;
            end
        end
        % if there is no repeated skill, add new skill to skill list
        % and substruct 5 pt
        if repeatskill == 0 
            pt = pt - 5;
            skilllist(end+1) = {skill};
            promptnumpt = sprintf('Now you have %d pt!let''s try your new skill in fight~',pt);
            msgnum = msgbox(promptnumpt);
            waitfor(msgnum)
            return
        % if there is repeated skill, pt doesnt change
        else
            msgrepeat = msgbox('You can not buy one skill twice!');
            waitfor(msgrepeat)
            return
        end
    end
    end
end
