function [cell] = mediumAi(aiHitStorage)
    global opponentRandShot;

    if ~isempty(aiHitStorage)%If opponent has hit a ship
        hitShip = aiHitStorage(end);
        if (length(aiHitStorage) >= 2)
            
            if abs(aiHitStorage(end) - aiHitStorage(end-1)) == 1 % this code detects a vertical ship and attacks vertically
                if ismember(aiHitStorage(end) + 1,opponentRandShot)
                    cell = aiHitStorage(end) + 1;
                elseif ismember(aiHitStorage(end) - 1,opponentRandShot)
                    cell = aiHitStorage(end) - 1;
                else
                    [cell] = pinwheelChoice(aiHitStorage);
                end
                    
            elseif abs(aiHitStorage(end) - aiHitStorage(end-1)) == 10 % this code detects a horizontal ship and attacks horizontally
                if ismember(aiHitStorage(end) + 10,opponentRandShot)
                    cell = aiHitStorage(end) + 10;
                elseif ismember(aiHitStorage(end) - 10,opponentRandShot)
                    cell = aiHitStorage(end) - 10;
                else
                    [cell] = pinwheelChoice(aiHitStorage);
                end
            else
                [cell] = pinwheelChoice(aiHitStorage);
            end
        else
            
            [cell] = pinwheelChoice(aiHitStorage);
            
        end
    else
        randIndex = randi(length(opponentRandShot),1);
        cell = opponentRandShot(randIndex);
    end
    opponentRandShot(opponentRandShot == cell) = [];  %Erases the last chosen spot from the random choice section


end

