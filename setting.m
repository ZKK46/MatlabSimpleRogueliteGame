function difficulty = setting(difficulty)
% use while loop to let player back the the setting menu
% after the player selected a difficulty
while 1
    % show the current difficulty
    diffmsg = sprintf('The current difficulty is %d',difficulty);
    % select difficulty
    difficultylist = {'1(easiest)','2','3','4(hardest)'};
        [selection,ok] = listdlg('PromptString',{diffmsg,'Choose difficulty'},...
            'SelectionMode','single',...
            'OKString','ok',...
            'CancelString','back',...
            'ListString',difficultylist);
        % if player select nothing
        % keep the current difficulty and back to menu and 
        if ~ok
            return
        end
        % palyer choose a difficulty, show the message of that difficulty
        % and change the current difficulty
        switch selection
            case 1
                msg1 = sprintf('The ''*'' bullet moves at the lowest speed\nYou have 5 hp and 3 atk\nYou will earn 3pt if you defeat the boss');
                diff1 = msgbox(msg1,'difficulty 1');
                waitfor(diff1)
                difficulty = 1;
            case 2
                msg2 = sprintf('The ''*'' bullet moves at a low speed\nYou have 3 hp and 2 atk\nYou will earn 4pt if you defeat the boss');
                diff2 = msgbox(msg2,'difficulty 2');
                waitfor(diff2)
                difficulty = 2;
            case 3
                msg3 = sprintf('The ''*'' bullet moves faster\nYou have 3 hp and 1 atk\nYou will earn 5pt if you defeat the boss');
                diff3 = msgbox(msg3,'difficulty 3');
                waitfor(diff3)
                difficulty = 3;
            case 4
                msg4 = sprintf('The ''*'' bullet moves at the same speed as you\nYou have 3 hp and 1 atk\nYou will earn 7pt if you defeat the boss');
                diff4 = msgbox(msg4,'difficulty 4');
                waitfor(diff4)
                difficulty = 4;
        end
end