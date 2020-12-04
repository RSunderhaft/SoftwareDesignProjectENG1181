function [board_display] = displaySunkShips(shipType, opponentShips, opponent_ship_array, board_display)
    % Description: This will dispay individual ships once the user sinks
    % them
    % How it works: This method will search for the specific ship sunk,
    % retrive the cordnates, then will displays ship parts on those
    % cordinates.

    %Nested for loops to search entire board
    for i = 1:10 
        for j = 1:10
            if (opponentShips(i,j) == shipType) % Check to make sure it is correct ship to display
                shipPartType = opponent_ship_array(i,j); % Gets 
                board_display(i,j+11) = shipPartType; %
            end
        end
    end
end

