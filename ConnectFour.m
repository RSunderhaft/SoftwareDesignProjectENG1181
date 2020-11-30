clc
clear


% Initialize scene
global my_scene;
my_scene = simpleGameEngine('ConnectFour.png',86,101);

% Set up variables to name the various sprites
empty_sprite = 1;
red_sprite = 2;
black_sprite = 3;

% Display empty board   
global board_display;
board_display = empty_sprite * ones(6,7);
drawScene(my_scene,board_display)

%% Game play
global playerChoices;
global openLocations;
playerChoices = zeros(6,7); % creates board representation in array form
openLocations = zeros(6,7);


while (checkWin(playerChoices) == 0)
    playerType = red_sprite; %Lets player one play
    playerTurn(playerType);
    drawScene(my_scene,board_display)
    
    if (checkWin(playerChoices) == 0) %% Don
        playerType = black_sprite; %Lets player two play
        playerTurn(playerType);
        drawScene(my_scene,board_display)
    end
end

    
if (playerType == red_sprite)
    fprintf("Red won the game!")
else
    fprintf("Black won the game!")
end
    

