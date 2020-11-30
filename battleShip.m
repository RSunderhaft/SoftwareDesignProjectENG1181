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
opponentLevel = input('AI Difficulty(Enter 0 for easy mode and 1 for Normal): '); %0 represents easy mode while 1 represents medium mode
 if (opponentLevel<0 || opponentLevel>1)
            fprintf('Error: Not valid Level');
            while(opponentLevel<0 || opponentLevel>1)
            opponentLevel = input('Reselect AI Difficulty: ');
            end
 end
opponentShips = Setup();
userShips = Setup();

userChoices = opponentShips;
opponentChoices = userShips;
%Figure out how to allow player to select tile

%% Playing the game

while (sum(userChoices, 'all') > -17) && (sum(opponentChoices, 'all') > -17)  %Logic to continue game until all ships have been sank
    
    turns = 1; %varibale to allow while loop to repeat of user picks same spot twice
    
    while turns == 1
        [row,col] = getMouseInput(my_scene);
        
        if col < 12 %Prevents user from clicking elsewhere and causing error
            break;
        end
        
        if userChoices(row,col-11) > 0 %if user hit a ship
            hitmiss_display(row,col) = hit_sprite;
            shipType = opponentShips(row,col-11);
            userChoices(row,col-11) = -1;
            if ~ismember(shipType, userChoices)
                %%Add Code to add amination of sunk ship
            end
            turns = 0;
        elseif userChoices(row,col-11) == 0
            hitmiss_display(row,col) = miss_sprite;
            turns = 0;
        end
    end
    drawScene(my_scene,board_display,hitmiss_display)
    
    turns = 1;
    pause(1);
    while turns == 1
        
        if (opponentLevel == 0)%% Gets random locatin for easy mode
          
            randCol = randi([1 10],1,1);
            randRow = randi([1 10],1,1);
        end
        if(opponentLevel == 1)%%Starts Normal AI
          randCol = randi([1 10],1,1);
            randRow = randi([1 10],1,1);
        end
        if opponentChoices(randRow,randCol) > 0 %if opponent hit a ship
            hitmiss_display(randRow,randCol) = hit_sprite;
            shipType = userShips(randRow,randCol);
            opponentChoices(randRow,randCol) = -1;
            turns = 0;
        elseif opponentChoices(randRow,randCol) == 0 %if opponent missed
            hitmiss_display(randRow,randCol) = miss_sprite;
            turns = 0;
        end
    end 
    drawScene(my_scene,board_display,hitmiss_display)
    



end
