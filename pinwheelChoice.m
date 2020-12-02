function [cell] = pinwheelChoice(aiHitStorage)
    global opponentRandShot;
    
    if ismember(aiHitStorage(end) + 1,opponentRandShot)
        cell = aiHitStorage(end) + 1;
    elseif ismember(aiHitStorage(end) + 10,opponentRandShot)
        cell = aiHitStorage(end) + 10;
    elseif ismember(aiHitStorage(end) - 1,opponentRandShot)
        cell = aiHitStorage(end) - 1;
    elseif ismember(aiHitStorage(end) - 10,opponentRandShot)
        cell = aiHitStorage(end) - 10;
    else
        randIndex = randi(length(opponentRandShot),1);
        cell = opponentRandShot(randIndex);
    end
end

