function [cell] = pinwheelChoice(aiHitStorage)
    % Description: The pinwheelChoice function allows the Medium Ai to choose next shot
    % selection.
    % How it works: After the opponent hits a user ship, the pinwheelChoice
    % function will start. The pinwheel method will explore around the hit
    % location as there are more ship parts around the first 
    % EX:               0 3 0                                               
    %                   4 X 2
    %                   0 1 0
    % As depicted in the visual above, after the opponent hits the user, it
    % will start at position one and make a pinwheel shape after it explore
    %s around the hit ship
    
    
    global opponentRandShot;
    
    if ismember(aiHitStorage(end) + 1,opponentRandShot) % One row down
        cell = aiHitStorage(end) + 1;
    elseif ismember(aiHitStorage(end) + 10,opponentRandShot) % One col to the right
        cell = aiHitStorage(end) + 10;
    elseif ismember(aiHitStorage(end) - 1,opponentRandShot) % One row up
        cell = aiHitStorage(end) - 1;
    elseif ismember(aiHitStorage(end) - 10,opponentRandShot) % One col to the left
        cell = aiHitStorage(end) - 10;
    else
        randIndex = randi(length(opponentRandShot),1); %If pinwheel cycle is complete, random selection
        cell = opponentRandShot(randIndex);
    end
end
