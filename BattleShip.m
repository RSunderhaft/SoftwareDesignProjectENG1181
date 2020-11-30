clc
clear


opponentLevel = input("Please choose a difficulty for you opponent. Enter 0 for Easy and 1 for Medium: "); % prompts user for difficulty level

while opponentLevel ~= 0 && opponentLevel ~= 1  %Prevents user from entering invalid opponent difficulty
    disp("You entered an invalid input. Try again.");
    opponentLevel = input("Please choose a difficulty for you opponent. Enter 0 for Easy and 1 for Medium: ");
end

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

% Place a ship
% Place the left pointing end of the ship at position (2,3)
board_display(2,3) = left_ship_sprite;
% Place the middle sections of the ship at positions (2,4-6)
board_display(2,4) = horiz_ship_sprite;
board_display(2,5) = horiz_ship_sprite;
board_display(2,6) = horiz_ship_sprite;
% Place the right pointing end of the ship at position (2,3)
board_display(2,7) = right_ship_sprite;

drawScene(my_scene,board_display)

% Set up hits and misses layer
hitmiss_display = blank_sprite * ones(10,21);
drawScene(my_scene,board_display,hitmiss_display)


%% Set board for opponent and player

opponentShips = Setup();  % Creates the user boards
userShips = Setup();

userChoices = opponentShips; %stores -1 values for all places player choose
opponentChoices = userShips;

userHits = opponentShips; %stores -1 values for only the ships they hit
opponentHits = userShips;
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
                %%Add Code to add amination of sunk ship
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
    while turns == 1
        
        if (opponentLevel == 0)%% Easy mode is just random selection
            randCol = randi([1 10],1,1);
            randRow = randi([1 10],1,1);
        end
        
        if (opponentLevel == 1)
            
        end
            
        if opponentChoices(randRow,randCol) > 0 %if opponent hit a ship
            hitmiss_display(randRow,randCol) = hit_sprite;
            shipType = userShips(randRow,randCol);
            opponentChoices(randRow,randCol) = -1;
            opponentHits(randRow,randCol) = -1;
            turns = 0;
        elseif opponentChoices(randRow,randCol) == 0 %if opponent missed
            hitmiss_display(randRow,randCol) = miss_sprite;
            opponentChoices(randRow,randCol) = -2;
            turns = 0;
        end
    end 
    drawScene(my_scene,board_display,hitmiss_display)
    
end





    