function [] = playerTurn(playerType)
    global my_scene;  %Makes these variables global so we don't have to pass them over
    global openLocations;
    global playerChoices;
    global board_display;
    
    [row,col] = getMouseInput(my_scene); %Gets player input
    colSelected = openLocations(:,col); 
    numPucks = sum(colSelected); % calulates the number of pucks in selected column
 
    while (numPucks >= 6) %Checks to see if choosen column is not full
        [row,col] = getMouseInput(my_scene);
        colSelected = openLocations(:,col);
        numPucks = sum(colSelected);
    end
    
    board_display(6 - numPucks,col) = playerType;  % places sprite
    openLocations(6-numPucks,col) = 1; %Sets the location of the puck placed
    if playerType == 2  %Tells array which player choose 
        playerChoices(6-numPucks,col) = -1;
    else
        playerChoices(6-numPucks,col) = 1;
    end
end
