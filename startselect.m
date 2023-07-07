function [color,shape,skill] = startselect(colorlist,shapelist,skilllist)
        % choose color
        [color,ok] = listdlg('PromptString','Choose your color:',...
        'SelectionMode','single',...
        'OKString','Next',...
        'CancelString','back',...
        'ListString',colorlist);
        % if player selects nothing, back to menu
        if ~ok
            color = 0;
            shape = 0;
            skill = 0;
            return
        end
        % transfer color selection to string
        switch color
            case 1
                color = 'white';
            case 2
                color = colorlist{2};
            case 3 
                color = colorlist{3};
            case 4
                color = colorlist{4};
            case 5
                color = colorlist{5};
            case 6
                color = colorlist{6};
            case 7
                color = colorlist{7};
        end

        % choose shape
        promptcolor = sprintf('Color:%s',color);
        [shape,ok] = listdlg('PromptString',{promptcolor;'Now choose your shape'},...
        'SelectionMode','single',...
        'OKString','Next',...
        'CancelString','back',...
        'ListString',shapelist);
        % if player selects nothing, back to menu
        if ~ok
            color = 0;
            shape = 0;
            skill = 0;
            return
        end
        % transfer shape selection to string
        switch shape
            case 1
            shape = 'circle';
            case 2
                shape = shapelist{2};
            case 3
                shape = shapelist{3};
            case 4 
                shape = shapelist{4};
            case 5
                shape = shapelist{5};
            case 6
                shape = shapelist{6};
        end
        % choose skill
        promptshape = sprintf('Shape:%s',shape);
        [skill,ok] = listdlg('PromptString',{promptcolor;promptshape;'Now choose your skill'},...
        'SelectionMode','single',...
        'OKString','Go!!',...
        'CancelString','back',...
        'ListString',skilllist);
        % if player selects nothing, back to menu
        if ~ok
            color = 0;
            shape = 0;
            skill = 0;
            return
        end
        % transfer skill selection to string
        switch skill
            case 1
                skill = 'no skill';
            case 2
                skill = skilllist{2};
            case 3
                skill = skilllist{3};
            case 4
                skill = skilllist{4};
        end
end