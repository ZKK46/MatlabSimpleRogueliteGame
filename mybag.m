function mybag(pt,colorlist,shapelist,skilllist)
        % add pt
        msgpt = sprintf('pt:%d',pt);
        msgbag = {'Your item list:';msgpt;' ';'color:'};
        % add colors
        for i = 1 : length(colorlist)
            msgbag(i+4) = colorlist(i);
        end
        % new row
        msgbag(i+5) = {' '};
        % add shapes
        msgbag(i+6) = {'shape:'};
        for j = 1 : length(shapelist)
            msgbag(i+6+j) = shapelist(j);
        end
        % new row
        msgbag(i+j+7) = {' '};
        % add skills
        msgbag(i+j+8) = {'skill:'};
        for k = 1:length(skilllist)
            msgbag(i+j+8+k) = skilllist(k);
        end
        % show a list of pt, color, shapes and skills
        bagmsg = msgbox(msgbag);
        waitfor(bagmsg)
end