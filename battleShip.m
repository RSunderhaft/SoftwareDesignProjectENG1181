clc
clear

gameRun = 1;
while gameRun ==1 % While loop to continue play if user wants to play again
    % Initialize scene
    my_scene = simpleGameEngine('Battleship.png',84,84);

    % Set up variables to name the various sprites
    blank_sprite = 1;
    water_sprite = 2;
    left_ship_sprite = 3;
    horiz_ship_sprite = 4;
    right_ship_sprite = 5;
    top_ship_sprite = 6;
    vert_ship_sprite = 7;
    bot_ship_sprite = 8;
    hit_sprite = 9;
    miss_sprite = 10;

    % Display empty board 
    board_display = water_sprite * ones(10,21);
    board_display(:,11) = blank_sprite;
    drawScene(my_scene,board_display)

    % Randomizes opponentShips
    opponentShips = Setup();

    % Prompts user with the option to place there own ships or not
    shipChoice = input('Would you like to place your own ships? (0 for no, 1 for yes): ');
    while (shipChoice~=0 && shipChoice~=1)
                fprintf('Error: Invalid choice. \n');
                shipChoice = input('Would you like to place your own ships? (0 for no, 1 for yes): ');
    end

    if (shipChoice == 1)
        userShips = placeShip(); % User places ships
    else
        userShips = Setup(); % Random Ships
    end


    global opponentRandShot;
    opponentRandShot = 1:100; % array for opponent to easily random pick shots
    aiHitStorage = [];  % This array is used for the medium difficulty mode

    % These arrays store the shot selections of each player
    userChoices = opponentShips;
    opponentChoices = userShips;

    % Creates arrays to easily display ships to screen
    user_ship_array = differentiateShips(userShips);
    opponent_ship_array = differentiateShips(opponentShips);

    % These arrays store the shots that hit a ship
    userHits = opponentShips; %stores -1 values for only the ships they hit
    opponentHits = userShips;

    %Displaying User ships on board
    for i = 1:10
        for j = 1:10
            if user_ship_array(i,j) >= 3
                board_display(i,j) = user_ship_array(i,j);
            end
        end
    end
    drawScene(my_scene,board_display)


    % Set up hits and misses layer
    hitmiss_display = blank_sprite * ones(10,21);
    drawScene(my_scene,board_display,hitmiss_display)


    % Prompts user for difficulty of opponent
    opponentLevel = input('AI Difficulty(Enter 0 for easy mode and 1 for Normal): '); %0 represents easy mode while 1 represents medium mode
    while (opponentLevel~=0 && opponentLevel~=1)
                fprintf('Error: Not valid Level \n');
                opponentLevel = input('Reselect AI Difficulty: ');
    end



    %% Playing the game

    while (sum(userHits, 'all') > -17) && (sum(opponentHits, 'all') > -17)  %Logic to continue game until all ships have been sank

    % Player Turn
        turns = 1; %variable to allow while loop to repeat if user picks same spot twice
        while turns == 1
            [row,col] = getMouseInput(my_scene);

            if col < 12 %Prevents user from clicking elsewhere and causing error
                continue;
            end

            if userChoices(row,col-11) > 0 % If user hit a ship
                hitmiss_display(row,col) = hit_sprite;
                shipType = opponentShips(row,col-11);
                userChoices(row,col-11) = -1;
                userHits(row,col-11) = -1;
                if ~ismember(shipType, userChoices) % If statement checks if opponents ship is sunk and displays ship
                    [board_display] = displaySunkShips(shipType, opponentShips, opponent_ship_array, board_display);
                    drawScene(my_scene,board_display,hitmiss_display);
                end
                turns = 0;
            elseif userChoices(row,col-11) == 0 % If user misses
                hitmiss_display(row,col) = miss_sprite;
                userChoices(row,col-11) = -1;
                turns = 0;
            end
        end  
        drawScene(my_scene,board_display,hitmiss_display)


        % Opponent Turn
        if (sum(userHits, 'all') > -17) && (sum(opponentHits, 'all') > -17)
            turns = 1;
            pause(1);
            while turns == 1

                % The opponent will utilize a 1 - 100 cell naming system where
                % the top left of the board is 1 and the bottom left is 100. The
                % cell numbers increase by 1 when you traverse down a column.
                %Eample:     1 4 7
                %            2 5 8
                %            3 6 9
                %Though calculations are used with this method, they will be
                %converted to standard (row,col) values

                % Easy mode
                if (opponentLevel == 0)
                    randIndex = randi(length(opponentRandShot),1);
                    cell = opponentRandShot(randIndex);
                end

                % Medium mode
                if (opponentLevel == 1) 
                    [cell] = mediumAi(aiHitStorage);
                end

                % Switches cell value to (row,col) form
                randRow = mod( cell , 10 );  
                if randRow == 0 
                    randRow = 10;
                end
                randCol = floor((cell - 1) / 10) + 1;

                %Print statement for debuging
                %fprintf("cell: %i  randRow: %i   randCol: %i\n", cell, randRow, randCol) 

                if opponentChoices(randRow,randCol) > 0 %if opponent hit a ship
                    hitmiss_display(randRow,randCol) = hit_sprite;
                    shipType = userShips(randRow,randCol);
                    opponentChoices(randRow,randCol) = -1;
                    opponentHits(randRow,randCol) = -1;
                    aiHitStorage(end+1) = cell; % adds the shot to memory if hit
                    turns = 0;
                elseif opponentChoices(randRow,randCol) == 0 %if opponent missed
                    hitmiss_display(randRow,randCol) = miss_sprite;
                    opponentChoices(randRow,randCol) = -2;
                    turns = 0;
                end
            end 
            drawScene(my_scene,board_display,hitmiss_display)
        end
    end    

    % Output when game is over to display winner.
    if sum(userHits, 'all') < sum(opponentHits, 'all')
        fprintf("You win. Congrats!\n");
    else
        fprintf("You lose. Better Luck next time.\n");
    end


    for i = 1:10 % displays all enemy ships when the game is over
        for j = 1:10
            if opponent_ship_array(i,j) >= 3
                board_display(i,j + 11) = opponent_ship_array(i,j);
            end
        end
    end
    drawScene(my_scene,board_display,hitmiss_display) 

    %Logic to continue game
    gameRun=input('Would you like to play again? (Enter 1 if yes/ 0 if no): \n'); 
    while gameRun ~= 1 && gameRun ~=0
        fprintf('Error: Incorrect Value \n');
        gameRun=input('Would you like to play again? (Enter 1 if yes/ 0 if no): \n');
    end
end
