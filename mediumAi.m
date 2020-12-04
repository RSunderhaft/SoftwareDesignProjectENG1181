function [cell] = mediumAi(aiHitStorage)
    % Description: The mediumAi method is the brain behind the medium AI and uses the
    % pinwheelChoice method in its execution.
    % How it works: For the mediumAi to work, it looks at the past shot
    % choices and checks to see if there is a straight pattern vertically
    % or horizontizaly. If it detects a ship, it will follow that ship
    % until it sinks it. When the opponent has hit a ship but recognizes no
    % pattern, it will use the pinwheelChoice method to help find a pattern
    

    global opponentRandShot;

    if ~isempty(aiHitStorage)%If opponent has hit a ship
        hitShip = aiHitStorage(end); % Adds hit ship to memory
        if (length(aiHitStorage) >= 2) % If more than two ships hit, possible pattern 
            
            if abs(aiHitStorage(end) - aiHitStorage(end-1)) == 1 % this code detects a vertical ship and attacks vertically
                if ismember(aiHitStorage(end) + 1,opponentRandShot)
                    cell = aiHitStorage(end) + 1;
                elseif ismember(aiHitStorage(end) - 1,opponentRandShot)
                    cell = aiHitStorage(end) - 1;
                else
                    [cell] = pinwheelChoice(aiHitStorage); % pinwheelChoice choice method
                end
                    
            elseif abs(aiHitStorage(end) - aiHitStorage(end-1)) == 10 % this code detects a horizontal ship and attacks horizontally
                if ismember(aiHitStorage(end) + 10,opponentRandShot)
                    cell = aiHitStorage(end) + 10;
                elseif ismember(aiHitStorage(end) - 10,opponentRandShot)
                    cell = aiHitStorage(end) - 10;
                else
                    [cell] = pinwheelChoice(aiHitStorage); % pinwheelChoice choice method
                end
            else
                [cell] = pinwheelChoice(aiHitStorage); % pinwheelChoice choice method
            end
        else
            
            [cell] = pinwheelChoice(aiHitStorage); % pinwheelChoice choice method
            
        end
    else
        randIndex = randi(length(opponentRandShot),1); % Random shot selection
        cell = opponentRandShot(randIndex);
    end
    opponentRandShot(opponentRandShot == cell) = [];  %Erases the last chosen spot from the random choice section
end

