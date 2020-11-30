function [winner] = checkWin(playerChoices)
%CHECKWIN -
%This function will check if a player won. The functin will return
%true if a player has 4 in a row
winner = 0;


% This nested for loop checks to see if a user has won in a column
for i = 1:7
    for j = 1:3
        col = playerChoices(:,i)';
        sumCol = sum(col(j:j+3));
        if sumCol == 4 || sumCol == -4
            winner = 1;
        end
    end
end

% This nested for loop checks to see if a user has won in a row
for i = 1:6
    for j = 1:4
        row = playerChoices(i,:);
        sumRow = sum(row(j:j+3));
        if sumRow == 4 || sumRow == -4
            winner = 1;
        end
    end
end

%This nested for loops checks to see if a user won in a diaginal: \ style
for i = 1:3
    for j = 1:4
        sumDiag1 = playerChoices(i,j) + playerChoices(i+1,j+1) + playerChoices(i+2,j+2) + playerChoices(i+3,j+3);
        
        if sumDiag1 == 4 || sumDiag1 == -4
            winner = 1;
        end
    end
end

%This nested for loops checks to see if a user won in a diaginal: / style
for i = 1:3
    for j = 1:4
        sumDiag2 = playerChoices(i,8-j) + playerChoices(i+1,7-j) + playerChoices(i+2,6-j) + playerChoices(i+3,5-j);
        
        if sumDiag2 == 4 || sumDiag2 == -4
            winner = 1;
        end
    end
end

