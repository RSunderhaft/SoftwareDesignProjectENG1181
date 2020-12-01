function [ userShips ] = placeShip()

% the "board" of ships is initially empty: 10 by 10 of zeros
userShips = zeros(10,10);

% length of the ships, ship 1 is the carrier and has length 5, 
% ship 2 is the battleship, ship 3 is the submarine, ship 4 is the cruiser,
% and ship 5 is the PT boat
ship_length = [5,4,3,3,2];

% loop over each ship
for ship_id = 1:5
    
   rowLimit = (11-ship_length(ship_id));
   colLimit = (11-ship_length(ship_id));
   
    % set a flag for the while loop, we will try random locations until we
    % find one that fits
    ship_placed = false;
    while ~ship_placed % continue to try and place the ship until successful
        % randomly choose between horizontal and vertical orientation by 
        % setting the horizontal flag here
        horizontal = input('Ship Orientation(Enter 0 for vertical and 1 for horizontal): ');
 if (horizontal<0 || horizontal>1)
            fprintf('Error: Invalid orientation \n');
            while(horizontal<0 || horizontal>1)
            horizontal = input('Reselect orientation (0 for vertical, 1 for horizontal): ');
            end
 end
 
 fprintf('Ship length: %d \n',ship_length(ship_id));

        if horizontal
            % set the the row and column of the left end new ship randomly
            % it can be on any row
            row = input('Select row for ship origin (1-10): ');
            if (row<1 || row>10)
                fprintf('Error: Invalid row.\n');
                while(row<1 || row>10)
                    row=input('Reselect row (1-10): ');
                end
            end
            % but only on a certain range of columns depending on its
            % length
            col = input(sprintf('Select Column for ship origin (1-%d): ',colLimit));
            if (col<1 || col>10)
                fprintf('Error: Invalid column.\n');
                while(col<1 || col>10)
                    col=input(sprintf('Reselect column (1-%d): ',colLimit));
                end
            end
            if (col>(11-ship_length(ship_id)))
                fprintf('Error: Ship out of bounds.\n');
                while(col>(11-ship_length(ship_id)))
                    col=input(sprintf('Reselect column (1-%d): ',colLimit));
                end
            end
            %randi([1 (11-ship_length(ship_id))]);
            
            % check to see if that location is empty by summing the values
            % on the board where the new ship would go, if it ends up being
            % zero, then there is room to put the new ship there
            if sum(userShips(row,col:(col+ship_length(ship_id)-1))) == 0
                % if it is, fill that part of the board with the ships id
                % number
                userShips(row,col:(col+ship_length(ship_id)-1)) = ship_id;
                % and set the ship_place flag to true so that we exit the
                % loop
                ship_placed = true;
            else
                fprintf('Ships overlap. Retry ship placement.\n');
            end
       else % vertical
            % if the ship is vertical, do that same thing as above, but now
            % the row and column indicate the top edge of the ship, and
            % only certain rows are allowed
            row = input(sprintf('Select Row for ship origin (1-%d): ',rowLimit));
            if (row<1 || row>10)
                fprintf('Error: Invalid Row.\n');
                while(row<1 || row>10)
                    row=input(sprintf('Reselect row (1-%d): ',rowLimit));
                end
            end
            if (row>(11-ship_length(ship_id)))
                fprintf('Error: Ship out of bounds.\n');
                while(row>(11-ship_length(ship_id)))
                   row=input(sprintf('Reselect row (1-%d): ',rowLimit));
                end
            end
            col = input('Select column for ship origin (1-10): ');
            if (col<1 || col>10)
                fprintf('Error: Invalid column.\n');
                while(col<1 || col>10)
                    col=input('Reselect column (1-10): ');
                end
            end
            
            % this part is same as in the horizontal orientation, but for a
            % range of rows instead of a range of columns
            if sum(userShips(row:(row+ship_length(ship_id)-1),col)) == 0
                userShips(row:(row+ship_length(ship_id)-1),col) = ship_id;
                ship_placed = true;
            else
                fprintf('Ships overlap. Retry ship placement.\n');
            end
        end
    end
end