function [board_display] = displaySunkShips(shipType, opponentShips, opponent_ship_array, board_display)
    
    for i = 1:10
        for j = 1:10
            if (opponentShips(i,j) == shipType) % Check to make sure it is correct shipt to display
                shipPartType = opponent_ship_array(i,j);
                board_display(i,j+11) = shipPartType;
            end
        end
    end
end

