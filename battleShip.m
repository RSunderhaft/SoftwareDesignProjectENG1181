clc
clear


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

opponentShips = Setup();

shipChoice = input('Would you like to place your own ships? (0 for no, 1 for yes): ');
while (shipChoice~=0 && shipChoice~=1)
            fprintf('Error: Invalid choice. \n');
            shipChoice = input('Would you like to place your own ships? (0 for no, 1 for yes): ');
end

if (shipChoice == 1)
    userShips = placeShip();
else
    userShips = Setup();
end

global opponentRandShot;
opponentRandShot = 1:100; % array for opponent to easily random pick shots
aiHitStorage = [];  % This array is used for the medium difficulty mode

userChoices = opponentShips;
opponentChoices = userShips;

user_ship_array = differentiateShips(userShips);
opponent_ship_array = differentiateShips(opponentShips);

userHits = opponentShips; %stores -1 values for only the ships they hit
opponentHits = userShips;
%Figure out how to allow player to select tile

% Place a ship

%board_display(2,3) = left_ship_sprite;
%board_display(2,4) = horiz_ship_sprite;
%board_display(2,5) = horiz_ship_sprite;
%board_display(2,6) = horiz_ship_sprite;
%board_display(2,7) = right_ship_sprite;
%Displaying User Ships on Board
for a = 1:10
for i = 1:10
if user_ship_array(a,i)==3
    board_display(a,i) = left_ship_sprite;
elseif user_ship_array(a,i)==4
    board_display(a,i) = horiz_ship_sprite;
  elseif user_ship_array(a,i)==5
    board_display(a,i) = right_ship_sprite; 
      elseif user_ship_array(a,i)==6
    board_display(a,i) = top_ship_sprite;
    elseif user_ship_array(a,i)==7
    board_display(a,i) = vert_ship_sprite; 
      elseif user_ship_array(a,i)==8
    board_display(a,i) = bot_ship_sprite; 
end
end
end



drawScene(my_scene,board_display)

% Set up hits and misses layer
hitmiss_display = blank_sprite * ones(10,21);
drawScene(my_scene,board_display,hitmiss_display)


%% Set board for opponent and player
opponentLevel = input('AI Difficulty(Enter 0 for easy mode and 1 for Normal): '); %0 represents easy mode while 1 represents medium mode
while (opponentLevel~=0 && opponentLevel~=1)
            fprintf('Error: Not valid Level \n');
            opponentLevel = input('Reselect AI Difficulty: ');
end

%Figure out how to allow player to select tile

%% Playing the game

while (sum(userHits, 'all') > -17) && (sum(opponentHits, 'all') > -17)  %Logic to continue game until all ships have been sank
    
    turns = 1; %variable to allow while loop to repeat of user picks same spot twice
    while turns == 1
        [row,col] = getMouseInput(my_scene);
        
        if col < 12 %Prevents user from clicking elsewhere and causing error
            continue;
        end
        
        if userChoices(row,col-11) > 0 %if user hit a ship
            hitmiss_display(row,col) = hit_sprite;
            shipType = opponentShips(row,col-11);
            userChoices(row,col-11) = -1;
            userHits(row,col-11) = -1;
            if ~ismember(shipType, userChoices)
                %Add Code to add amination of sunk ship
            end
            turns = 0;
        elseif userChoices(row,col-11) == 0
            hitmiss_display(row,col) = miss_sprite;
            userChoices(row,col-11) = -1;
            turns = 0;
        end
    end  % code for user hitting ship
    drawScene(my_scene,board_display,hitmiss_display)
    
    
    
    turns = 1;
    pause(1);
%% Opponent Turn
    while turns == 1
        
        % The opponent will utilize a 1 - 100 cell naming system where
        % the top left of the board is 1 and the bottom left is 100. The
        % cell numbers increase by 1 when you traverse down a column.
        %Eample:     1 4 7
        %            2 5 8
        %            3 6 9
        %Though calculations are used with this method, they will be
        %converted to standard (row,col) values
        
        if (opponentLevel == 0)%% Easy mode is just random selection
            randIndex = randi(length(opponentRandShot),1);
            cell = opponentRandShot(randIndex);
        end
        
        if (opponentLevel == 1) % Medium mode
            [cell] = mediumAi(aiHitStorage);
        end
        
        randRow = mod( cell , 10 );  % Switches cell value to (row,col) form
        if randRow == 0 
            randRow = 10;
        end
        randCol = floor((cell - 1) / 10) + 1;

        fprintf("cell: %i  randRow: %i   randCol: %i\n", cell, randRow, randCol) % Used for error checking
        
% Opponent hit logic
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
