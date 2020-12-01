function [shipParts] = differentiateShips(ships)
shipParts = zeros(10,10);
if (ships(1,1) ~= 0) && (ships(2,1) == ships(1,1))
    shipParts(1,1) = 7;
elseif (ships(1,1) ~= 0) && (ships(1,1) == ships(1,2))
    shipParts(1,1) = 8;
end
if (ships(10,1) ~= 0) && (ships(9,1) == ships(10,1))
    shipParts(10,1) = 10;
elseif (ships(10,1) ~= 0) && (ships(10,1) == ships(10,2))
    shipParts(10,1) = 8;
end
if (ships(10,10) ~= 0) && (ships(9,10) == ships(10,10))
    shipParts(10,10) = 10;
elseif (ships(10,10) ~= 0) && (ships(10,10) == ships(10,9))
    shipParts(10,10) = 9;
end
if (ships(1,10) ~= 0) && (ships(2,10) == ships(1,10))
    shipParts(1,10) = 7;
elseif (ships(1,10) ~= 0) && (ships(1,10) == ships(1,9))
    shipParts(1,10) = 9;
end
for i = 2:9
    if (ships(1,i) == 1)
        if (ships(2,i) == 1)
            shipParts(1,i) = 7;
        elseif (ships(1,i+1) == 1) && (ships(1,i-1) == 1)
            shipParts(1,i) = 6;
        elseif (ships(1,i+1) == 1) && (ships(1,i-1) ~= 1)
            shipParts(1,i) = 8;
        else
            shipParts(1,i) = 9;
        end
    end
    if (ships(1,i) == 2)
        if (ships(2,i) == 2)
            shipParts(1,i) = 7;
        elseif (ships(1,i+1) == 2) && (ships(1,i-1) == 2)
            shipParts(1,i) = 6;
        elseif (ships(1,i+1) == 2) && (ships(1,i-1) ~= 2)
            shipParts(1,i) = 8;
        else
            shipParts(1,i) = 9;
        end
    end
    if (ships(1,i) == 3)
        if (ships(2,i) == 3)
            shipParts(1,i) = 7;
        elseif (ships(1,i+1) == 3) && (ships(1,i-1) == 3)
            shipParts(1,i) = 6;
        elseif (ships(1,i+1) == 3) && (ships(1,i-1) ~= 3)
            shipParts(1,i) = 8;
        else
            shipParts(1,i) = 9;
        end
    end
    if (ships(1,i) == 4)
        if (ships(2,i) == 4)
            shipParts(1,i) = 7;
        elseif (ships(1,i+1) == 4) && (ships(1,i-1) == 4)
            shipParts(1,i) = 6;
        elseif (ships(1,i+1) == 4) && (ships(1,i-1) ~= 4)
            shipParts(1,i) = 8;
        else
            shipParts(1,i) = 9;
        end
    end
    if (ships(1,i) == 5)
        if (ships(2,i) == 5)
            shipParts(1,i) = 7;
        elseif (ships(1,i+1) == 5)
            shipParts(1,i) = 8;
        else
            shipParts(1,i) = 9;
        end
    end
    if (ships(2,i) == 1)
        if (ships(3,i) == 1) && (ships(1,i) ~= 1)
            shipParts(2,i) = 7;
        elseif (ships(3,i) == 1) && (ships(1,i) == 1)
            shipParts(2,i) = 11;
        elseif (ships(2,i+1) == 1) && (ships(2,i-1) == 1)
            shipParts(2,i) = 6;
        elseif (ships(2,i+1) == 1) && (ships(2,i-1) ~= 1)
            shipParts(2,i) = 8;
        else
            shipParts(2,i) = 9;
        end
    end
    if (ships(2,i) == 2)
        if (ships(3,i) == 2) && (ships(1,i) ~= 2)
            shipParts(2,i) = 7;
        elseif (ships(3,i) == 2) && (ships(1,i) == 2)
            shipParts(2,i) = 11;
        elseif (ships(2,i+1) == 2) && (ships(2,i-1) == 2)
            shipParts(2,i) = 6;
        elseif (ships(2,i+1) == 2) && (ships(2,i-1) ~= 2)
            shipParts(2,i) = 8;
        else
            shipParts(2,i) = 9;
        end
    end
    if (ships(2,i) == 3)
        if (ships(3,i) == 3) && (ships(1,i) ~= 3)
            shipParts(2,i) = 7;
        elseif (ships(1,i) == 3)
            shipParts(2,i) = 11;
        elseif (ships(2,i+1) == 3) && (ships(2,i-1) == 3)
            shipParts(2,i) = 6;
        elseif (ships(2,i+1) == 3) && (ships(2,i-1) ~= 3)
            shipParts(2,i) = 8;
        else
            shipParts(2,i) = 9;
        end
    end
    if (ships(2,i) == 4)
        if (ships(3,i) == 4) && (ships(1,i) ~= 4)
            shipParts(2,i) = 7;
        elseif (ships(1,i) == 4)
            shipParts(2,i) = 11;
        elseif (ships(2,i+1) == 4) && (ships(2,i-1) == 4)
            shipParts(2,i) = 6;
        elseif (ships(2,i+1) == 4) && (ships(2,i-1) ~= 4)
            shipParts(2,i) = 8;
        else
            shipParts(2,i) = 9;
        end
    end
    if (ships(2,i) == 5)
        if (ships(3,i) == 5)
            shipParts(2,i) = 7;
        elseif (ships(1,i) == 5)
            shipParts(2,i) = 10;
        elseif (ships(2,i+1) == 5)
            shipParts(2,i) = 8;
        else
            shipParts(2,i) = 9;
        end
    end
    if (ships(3,i) == 1)
        if (ships(4,i) == 1) && (ships(2,i) ~= 1)
            shipParts(3,i) = 7;
        elseif (ships(4,i) == 1) && (ships(2,i) == 1)
            shipParts(3,i) = 11;
        elseif (ships(3,i+1) == 1) && (ships(3,i-1) == 1)
            shipParts(3,i) = 6;
        elseif (ships(3,i+1) == 1) && (ships(3,i-1) ~= 1)
            shipParts(3,i) = 8;
        else
            shipParts(3,i) = 9;
        end
    end
    if (ships(3,i) == 2)
        if (ships(4,i) == 2) && (ships(2,i) ~= 2)
            shipParts(3,i) = 7;
        elseif (ships(4,i) == 2) && (ships(2,i) == 2)
            shipParts(3,i) = 11;
        elseif (ships(3,i+1) == 2) && (ships(3,i-1) == 2)
            shipParts(3,i) = 6;
        elseif (ships(3,i+1) == 2) && (ships(3,i-1) ~= 2)
            shipParts(3,i) = 8;
        else
            shipParts(3,i) = 9;
        end
    end
    if (ships(3,i) == 3)
        if (ships(4,i) == 3) && (ships(2,i) ~= 3)
            shipParts(3,i) = 7;
        elseif (ships(2,i) == 3) && (ships(4,i) == 3)
            shipParts(3,i) = 11;
        elseif (ships(4,i) ~= 3) && (ships(2,i) == 3)
            shipParts(3,i) = 10;
        elseif (ships(3,i+1) == 3) && (ships(3,i-1) == 3)
            shipParts(3,i) = 6;
        elseif (ships(3,i+1) == 3) && (ships(3,i-1) ~= 3)
            shipParts(3,i) = 8;
        else
            shipParts(3,i) = 9;
        end
    end
    if (ships(3,i) == 4)
        if (ships(4,i) == 4) && (ships(2,i) ~= 4)
            shipParts(3,i) = 7;
        elseif (ships(2,i) == 4) && (ships(4,i) == 4)
            shipParts(3,i) = 11;
        elseif (ships(4,i) ~= 4) && (ships(2,i) == 4)
            shipParts(3,i) = 10;
        elseif (ships(3,i+1) == 4) && (ships(3,i-1) == 4)
            shipParts(3,i) = 6;
        elseif (ships(3,i+1) == 4) && (ships(3,i-1) ~= 4)
            shipParts(3,i) = 8;
        else
            shipParts(3,i) = 9;
        end
    end
    if (ships(3,i) == 5)
        if (ships(4,i) == 5)
            shipParts(3,i) = 7;
        elseif (ships(2,i) == 5)
            shipParts(3,i) = 10;
        elseif (ships(3,i+1) == 5)
            shipParts(3,i) = 8;
        else
            shipParts(3,i) = 9;
        end
    end
    if (ships(4,i) == 1)
        if (ships(5,i) == 1) && (ships(3,i) ~= 1)
            shipParts(4,i) = 7;
        elseif (ships(5,i) == 1) && (ships(3,i) == 1)
            shipParts(4,i) = 11;
        elseif (ships(4,i+1) == 1) && (ships(4,i-1) == 1)
            shipParts(4,i) = 6;
        elseif (ships(4,i+1) == 1) && (ships(4,i-1) ~= 1)
            shipParts(4,i) = 8;
        else
            shipParts(4,i) = 9;
        end
    end
    if (ships(4,i) == 2)
        if (ships(5,i) == 2) && (ships(3,i) ~= 2)
            shipParts(4,i) = 7;
        elseif (ships(5,i) == 2) && (ships(3,i) == 2)
            shipParts(4,i) = 11;
        elseif (ships(5,i) ~= 2) && (ships(3,i) == 2)
            shipParts(4,i) = 10;
        elseif (ships(4,i+1) == 2) && (ships(4,i-1) == 2)
            shipParts(4,i) = 6;
        elseif (ships(4,i+1) == 2) && (ships(4,i-1) ~= 2)
            shipParts(4,i) = 8;
        else
            shipParts(4,i) = 9;
        end
    end
    if (ships(4,i) == 3)
        if (ships(5,i) == 3) && (ships(3,i) ~= 3)
            shipParts(4,i) = 7;
        elseif (ships(3,i) == 3) && (ships(5,i) == 3)
            shipParts(4,i) = 11;
        elseif (ships(5,i) ~= 3) && (ships(3,i) == 3)
            shipParts(4,i) = 10;
        elseif (ships(4,i+1) == 3) && (ships(4,i-1) == 3)
            shipParts(4,i) = 6;
        elseif (ships(4,i+1) == 3) && (ships(4,i-1) ~= 3)
            shipParts(4,i) = 8;
        else
            shipParts(4,i) = 9;
        end
    end
    if (ships(4,i) == 4)
        if (ships(5,i) == 4) && (ships(3,i) ~= 4)
            shipParts(4,i) = 7;
        elseif (ships(3,i) == 4) && (ships(5,i) == 4)
            shipParts(4,i) = 11;
        elseif (ships(5,i) ~= 4) && (ships(3,i) == 4)
            shipParts(4,i) = 10;
        elseif (ships(4,i+1) == 4) && (ships(4,i-1) == 4)
            shipParts(4,i) = 6;
        elseif (ships(4,i+1) == 4) && (ships(4,i-1) ~= 4)
            shipParts(4,i) = 8;
        else
            shipParts(4,i) = 9;
        end
    end
    if (ships(4,i) == 5)
        if (ships(5,i) == 5)
            shipParts(4,i) = 7;
        elseif (ships(3,i) == 5)
            shipParts(4,i) = 10;
        elseif (ships(4,i+1) == 5)
            shipParts(4,i) = 8;
        else
            shipParts(4,i) = 9;
        end
    end
    if (ships(5,i) == 1)
        if (ships(6,i) == 1) && (ships(4,i) ~= 1)
            shipParts(5,i) = 7;
        elseif (ships(6,i) == 1) && (ships(4,i) == 1)
            shipParts(5,i) = 11;
        elseif (ships(6,i) ~= 1) && (ships(4,i) == 1)
            shipParts(5,i) = 10;
        elseif (ships(5,i+1) == 1) && (ships(5,i-1) == 1)
            shipParts(5,i) = 6;
        elseif (ships(5,i+1) == 1) && (ships(5,i-1) ~= 1)
            shipParts(5,i) = 8;
        else
            shipParts(5,i) = 9;
        end
    end
    if (ships(5,i) == 2)
        if (ships(6,i) == 2) && (ships(4,i) ~= 2)
            shipParts(5,i) = 7;
        elseif (ships(6,i) == 2) && (ships(4,i) == 2)
            shipParts(5,i) = 11;
        elseif (ships(6,i) ~= 2) && (ships(4,i) == 2)
            shipParts(5,i) = 10;
        elseif (ships(5,i+1) == 2) && (ships(5,i-1) == 2)
            shipParts(5,i) = 6;
        elseif (ships(5,i+1) == 2) && (ships(5,i-1) ~= 2)
            shipParts(5,i) = 8;
        else
            shipParts(5,i) = 9;
        end
    end
    if (ships(5,i) == 3)
        if (ships(6,i) == 3) && (ships(4,i) ~= 3)
            shipParts(5,i) = 7;
        elseif (ships(4,i) == 3) && (ships(6,i) == 3)
            shipParts(5,i) = 11;
        elseif (ships(6,i) ~= 3) && (ships(4,i) == 3)
            shipParts(5,i) = 10;
        elseif (ships(5,i+1) == 3) && (ships(5,i-1) == 3)
            shipParts(5,i) = 6;
        elseif (ships(5,i+1) == 3) && (ships(5,i-1) ~= 3)
            shipParts(5,i) = 8;
        else
            shipParts(5,i) = 9;
        end
    end
    if (ships(5,i) == 4)
        if (ships(6,i) == 4) && (ships(4,i) ~= 4)
            shipParts(5,i) = 7;
        elseif (ships(4,i) == 4) && (ships(6,i) == 4)
            shipParts(5,i) = 11;
        elseif (ships(6,i) ~= 4) && (ships(4,i) == 4)
            shipParts(5,i) = 10;
        elseif (ships(5,i+1) == 4) && (ships(5,i-1) == 4)
            shipParts(5,i) = 6;
        elseif (ships(5,i+1) == 4) && (ships(5,i-1) ~= 4)
            shipParts(5,i) = 8;
        else
            shipParts(5,i) = 9;
        end
    end
    if (ships(5,i) == 5)
        if (ships(6,i) == 5)
            shipParts(5,i) = 7;
        elseif (ships(4,i) == 5)
            shipParts(5,i) = 10;
        elseif (ships(5,i+1) == 5)
            shipParts(5,i) = 8;
        else
            shipParts(5,i) = 9;
        end
    end
    if (ships(6,i) == 1)
        if (ships(7,i) == 1) && (ships(5,i) ~= 1)
            shipParts(6,i) = 7;
        elseif (ships(7,i) == 1) && (ships(5,i) == 1)
            shipParts(6,i) = 11;
        elseif (ships(7,i) ~= 1) && (ships(5,i) == 1)
            shipParts(6,i) = 10;
        elseif (ships(6,i+1) == 1) && (ships(6,i-1) == 1)
            shipParts(6,i) = 6;
        elseif (ships(6,i+1) == 1) && (ships(6,i-1) ~= 1)
            shipParts(6,i) = 8;
        else
            shipParts(6,i) = 9;
        end
    end
    if (ships(6,i) == 2)
        if (ships(7,i) == 2) && (ships(5,i) ~= 2)
            shipParts(6,i) = 7;
        elseif (ships(7,i) == 2) && (ships(5,i) == 2)
            shipParts(6,i) = 11;
        elseif (ships(7,i) ~= 2) && (ships(5,i) == 2)
            shipParts(6,i) = 10;
        elseif (ships(6,i+1) == 2) && (ships(6,i-1) == 2)
            shipParts(6,i) = 6;
        elseif (ships(6,i+1) == 2) && (ships(6,i-1) ~= 2)
            shipParts(6,i) = 8;
        else
            shipParts(6,i) = 9;
        end
    end
    if (ships(6,i) == 3)
        if (ships(7,i) == 3) && (ships(5,i) ~= 3)
            shipParts(6,i) = 7;
        elseif (ships(5,i) == 3) && (ships(7,i) == 3)
            shipParts(6,i) = 11;
        elseif (ships(7,i) ~= 3) && (ships(5,i) == 3)
            shipParts(6,i) = 10;
        elseif (ships(6,i+1) == 3) && (ships(6,i-1) == 3)
            shipParts(6,i) = 6;
        elseif (ships(6,i+1) == 3) && (ships(6,i-1) ~= 3)
            shipParts(6,i) = 8;
        else
            shipParts(6,i) = 9;
        end
    end
    if (ships(6,i) == 4)
        if (ships(7,i) == 4) && (ships(5,i) ~= 4)
            shipParts(6,i) = 7;
        elseif (ships(5,i) == 4) && (ships(7,i) == 4)
            shipParts(6,i) = 11;
        elseif (ships(7,i) ~= 4) && (ships(5,i) == 4)
            shipParts(6,i) = 10;
        elseif (ships(6,i+1) == 4) && (ships(6,i-1) == 4)
            shipParts(6,i) = 6;
        elseif (ships(6,i+1) == 4) && (ships(6,i-1) ~= 4)
            shipParts(6,i) = 8;
        else
            shipParts(6,i) = 9;
        end
    end
    if (ships(6,i) == 5)
        if (ships(7,i) == 5)
            shipParts(6,i) = 7;
        elseif (ships(5,i) == 5)
            shipParts(6,i) = 10;
        elseif (ships(6,i+1) == 5)
            shipParts(6,i) = 8;
        else
            shipParts(6,i) = 9;
        end
    end
    if (ships(7,i) == 1)
        if (ships(8,i) == 1) && (ships(6,i) == 1)
            shipParts(7,i) = 11;
        elseif (ships(8,i) ~= 1) && (ships(6,i) == 1)
            shipParts(7,i) = 10;
        elseif (ships(7,i+1) == 1) && (ships(7,i-1) == 1)
            shipParts(7,i) = 6;
        elseif (ships(7,i+1) == 1) && (ships(7,i-1) ~= 1)
            shipParts(7,i) = 8;
        else
            shipParts(7,i) = 9;
        end
    end
    if (ships(7,i) == 2)
        if (ships(8,i) == 2) && (ships(6,i) ~= 2)
            shipParts(7,i) = 7;
        elseif (ships(8,i) == 2) && (ships(6,i) == 2)
            shipParts(7,i) = 11;
        elseif (ships(8,i) ~= 2) && (ships(6,i) == 2)
            shipParts(7,i) = 10;
        elseif (ships(7,i+1) == 2) && (ships(7,i-1) == 2)
            shipParts(7,i) = 6;
        elseif (ships(7,i+1) == 2) && (ships(7,i-1) ~= 2)
            shipParts(7,i) = 8;
        else
            shipParts(7,i) = 9;
        end
    end
    if (ships(7,i) == 3)
        if (ships(8,i) == 3) && (ships(6,i) ~= 3)
            shipParts(7,i) = 7;
        elseif (ships(6,i) == 3) && (ships(8,i) == 3)
            shipParts(7,i) = 11;
        elseif (ships(8,i) ~= 3) && (ships(6,i) == 3)
            shipParts(7,i) = 10;
        elseif (ships(7,i+1) == 3) && (ships(7,i-1) == 3)
            shipParts(7,i) = 6;
        elseif (ships(7,i+1) == 3) && (ships(7,i-1) ~= 3)
            shipParts(7,i) = 8;
        else
            shipParts(7,i) = 9;
        end
    end
    if (ships(7,i) == 4)
        if (ships(8,i) == 4) && (ships(6,i) ~= 4)
            shipParts(7,i) = 7;
        elseif (ships(6,i) == 4) && (ships(8,i) == 4)
            shipParts(7,i) = 11;
        elseif (ships(8,i) ~= 4) && (ships(6,i) == 4)
            shipParts(7,i) = 10;
        elseif (ships(7,i+1) == 4) && (ships(7,i-1) == 4)
            shipParts(7,i) = 6;
        elseif (ships(7,i+1) == 4) && (ships(7,i-1) ~= 4)
            shipParts(7,i) = 8;
        else
            shipParts(7,i) = 9;
        end
    end
    if (ships(7,i) == 5)
        if (ships(8,i) == 5)
            shipParts(7,i) = 7;
        elseif (ships(6,i) == 5)
            shipParts(7,i) = 10;
        elseif (ships(7,i+1) == 5)
            shipParts(7,i) = 8;
        else
            shipParts(7,i) = 9;
        end
    end
    if (ships(8,i) == 1)
        if (ships(9,i) == 1) && (ships(7,i) == 1)
            shipParts(8,i) = 11;
        elseif (ships(9,i) ~= 1) && (ships(7,i) == 1)
            shipParts(8,i) = 10;
        elseif (ships(8,i+1) == 1) && (ships(8,i-1) == 1)
            shipParts(8,i) = 6;
        elseif (ships(8,i+1) == 1) && (ships(8,i-1) ~= 1)
            shipParts(8,i) = 8;
        else
            shipParts(8,i) = 9;
        end
    end
    if (ships(8,i) == 2)
        if (ships(9,i) == 2) && (ships(7,i) == 2)
            shipParts(8,i) = 11;
        elseif (ships(9,i) ~= 2) && (ships(7,i) == 2)
            shipParts(8,i) = 10;
        elseif (ships(8,i+1) == 2) && (ships(8,i-1) == 2)
            shipParts(8,i) = 6;
        elseif (ships(8,i+1) == 2) && (ships(8,i-1) ~= 2)
            shipParts(8,i) = 8;
        else
            shipParts(8,i) = 9;
        end
    end
    if (ships(8,i) == 3)
        if (ships(9,i) == 3) && (ships(7,i) ~= 3)
            shipParts(8,i) = 7;
        elseif (ships(7,i) == 3) && (ships(9,i) == 3)
            shipParts(8,i) = 11;
        elseif (ships(9,i) ~= 3) && (ships(7,i) == 3)
            shipParts(8,i) = 10;
        elseif (ships(8,i+1) == 3) && (ships(8,i-1) == 3)
            shipParts(8,i) = 6;
        elseif (ships(8,i+1) == 3) && (ships(8,i-1) ~= 3)
            shipParts(8,i) = 8;
        else
            shipParts(8,i) = 9;
        end
    end
    if (ships(8,i) == 4)
        if (ships(9,i) == 4) && (ships(7,i) ~= 4)
            shipParts(8,i) = 7;
        elseif (ships(7,i) == 4) && (ships(9,i) == 4)
            shipParts(8,i) = 11;
        elseif (ships(9,i) ~= 4) && (ships(7,i) == 4)
            shipParts(8,i) = 10;
        elseif (ships(8,i+1) == 4) && (ships(8,i-1) == 4)
            shipParts(8,i) = 6;
        elseif (ships(8,i+1) == 4) && (ships(8,i-1) ~= 4)
            shipParts(8,i) = 8;
        else
            shipParts(8,i) = 9;
        end
    end
    if (ships(8,i) == 5)
        if (ships(9,i) == 5)
            shipParts(8,i) = 7;
        elseif (ships(7,i) == 5)
            shipParts(8,i) = 10;
        elseif (ships(8,i+1) == 5)
            shipParts(8,i) = 8;
        else
            shipParts(8,i) = 9;
        end
    end
    if (ships(9,i) == 1)
        if (ships(10,i) == 1) && (ships(8,i) == 1)
            shipParts(9,i) = 11;
        elseif (ships(10,i) ~= 1) && (ships(8,i) == 1)
            shipParts(9,i) = 10;
        elseif (ships(9,i+1) == 1) && (ships(9,i-1) == 1)
            shipParts(9,i) = 6;
        elseif (ships(9,i+1) == 1) && (ships(9,i-1) ~= 1)
            shipParts(9,i) = 8;
        else
            shipParts(9,i) = 9;
        end
    end
    if (ships(9,i) == 2)
        if (ships(10,i) == 2) && (ships(8,i) == 2)
            shipParts(9,i) = 11;
        elseif (ships(10,i) ~= 2) && (ships(8,i) == 2)
            shipParts(9,i) = 10;
        elseif (ships(9,i+1) == 2) && (ships(9,i-1) == 2)
            shipParts(9,i) = 6;
        elseif (ships(9,i+1) == 2) && (ships(9,i-1) ~= 2)
            shipParts(9,i) = 8;
        else
            shipParts(9,i) = 9;
        end
    end
    if (ships(9,i) == 3)
        if (ships(8,i) == 3) && (ships(10,i) == 3)
            shipParts(9,i) = 11;
        elseif (ships(10,i) ~= 3) && (ships(8,i) == 3)
            shipParts(9,i) = 10;
        elseif (ships(9,i+1) == 3) && (ships(9,i-1) == 3)
            shipParts(9,i) = 6;
        elseif (ships(9,i+1) == 3) && (ships(9,i-1) ~= 3)
            shipParts(9,i) = 8;
        else
            shipParts(9,i) = 9;
        end
    end
    if (ships(9,i) == 4)
        if (ships(8,i) == 4) && (ships(10,i) == 4)
            shipParts(9,i) = 11;
        elseif (ships(10,i) ~= 4) && (ships(8,i) == 4)
            shipParts(9,i) = 10;
        elseif (ships(9,i+1) == 4) && (ships(9,i-1) == 4)
            shipParts(9,i) = 6;
        elseif (ships(9,i+1) == 4) && (ships(9,i-1) ~= 4)
            shipParts(9,i) = 8;
        else
            shipParts(9,i) = 9;
        end
    end
    if (ships(9,i) == 5)
        if (ships(10,i) == 5)
            shipParts(9,i) = 7;
        elseif (ships(8,i) == 5)
            shipParts(9,i) = 10;
        elseif (ships(9,i+1) == 5)
            shipParts(9,i) = 8;
        else
            shipParts(9,i) = 9;
        end
    end
    if (ships(10,i) == 1)
        if (ships(9,i) == 1)
            shipParts(10,i) = 10;
        elseif (ships(10,i+1) == 1) && (ships(10,i-1) == 1)
            shipParts(10,i) = 6;
        elseif (ships(10,i+1) == 1) && (ships(10,i-1) ~= 1)
            shipParts(10,i) = 8;
        else
            shipParts(10,i) = 9;
        end
    end
    if (ships(10,i) == 2)
        if (ships(9,i) == 2)
            shipParts(10,i) = 10;
        elseif (ships(10,i+1) == 2) && (ships(10,i-1) == 2)
            shipParts(10,i) = 6;
        elseif (ships(10,i+1) == 2) && (ships(10,i-1) ~= 2)
            shipParts(10,i) = 8;
        else
            shipParts(10,i) = 9;
        end
    end
    if (ships(10,i) == 3)
        if (ships(9,i) == 3)
            shipParts(10,i) = 10;
        elseif (ships(10,i+1) == 3) && (ships(10,i-1) == 3)
            shipParts(10,i) = 6;
        elseif (ships(10,i+1) == 3) && (ships(10,i-1) ~= 3)
            shipParts(10,i) = 8;
        else
            shipParts(10,i) = 9;
        end
    end
    if (ships(10,i) == 4)
        if (ships(9,i) == 4)
            shipParts(10,i) = 10;
        elseif (ships(10,i+1) == 4) && (ships(10,i-1) == 4)
            shipParts(10,i) = 6;
        elseif (ships(10,i+1) == 4) && (ships(10,i-1) ~= 4)
            shipParts(10,i) = 8;
        else
            shipParts(10,i) = 9;
        end
    end
    if (ships(10,i) == 5)
        if (ships(9,i) == 5)
            shipParts(10,i) = 10;
        elseif (ships(10,i+1) == 5)
            shipParts(10,i) = 8;
        else
            shipParts(10,i) = 9;
        end
    end
    if (ships(i,1) == 1)
        if (ships(i,2) == 1)
            shipParts(i,1) = 8;
        elseif (ships(i+1,1) == 1) && (ships (i-1,1) == 1)
            shipParts(i,1) = 11;
        elseif (ships(i+1,1) == 1) && (ships (i-1,1) ~= 1)
            shipParts(i,1) = 7;
        else
            shipParts(i,1) = 10;
        end
    end
    if (ships(i,1) == 2)
        if (ships(i,2) == 2)
            shipParts(i,1) = 8;
        elseif (ships(i+1,1) == 2) && (ships (i-1,1) == 2)
            shipParts(i,1) = 11;
        elseif (ships(i+1,1) == 2) && (ships (i-1,1) ~= 2)
            shipParts(i,1) = 7;
        else
            shipParts(i,1) = 10;
        end
    end
    if (ships(i,1) == 3)
        if (ships(i,2) == 3)
            shipParts(i,1) = 8;
        elseif (ships(i+1,1) == 3) && (ships (i-1,1) == 3)
            shipParts(i,1) = 11;
        elseif (ships(i+1,1) == 3) && (ships (i-1,1) ~= 3)
            shipParts(i,1) = 7;
        else
            shipParts(i,1) = 10;
        end
    end
    if (ships(i,1) == 4)
        if (ships(i,2) == 4)
            shipParts(i,1) = 8;
        elseif (ships(i+1,1) == 4) && (ships (i-1,1) == 4)
            shipParts(i,1) = 11;
        elseif (ships(i+1,1) == 4) && (ships (i-1,1) ~= 4)
            shipParts(i,1) = 7;
        else
            shipParts(i,1) = 10;
        end
    end
    if (ships(i,1) == 5)
        if (ships(i,2) == 5)
            shipParts(i,1) = 8;
        elseif (ships(i+1,1) == 5) && (ships (i-1,1) ~= 5)
            shipParts(i,1) = 7;
        else
            shipParts(i,1) = 10;
        end
    end
    if (ships(i,10) == 1)
        if (ships(i,9) == 1)
            shipParts(i,10) = 9;
        elseif (ships(i+1,10) == 1) && (ships (i-1,10) == 1)
            shipParts(i,10) = 11;
        elseif (ships(i+1,10) == 1) && (ships (i-1,10) ~= 1)
            shipParts(i,10) = 7;
        else
            shipParts(i,10) = 10;
        end
    end
    if (ships(i,10) == 2)
        if (ships(i,9) == 2)
            shipParts(i,10) = 9;
        elseif (ships(i+1,10) == 2) && (ships (i-1,10) == 2)
            shipParts(i,10) = 11;
        elseif (ships(i+1,10) == 2) && (ships (i-1,10) ~= 2)
            shipParts(i,10) = 7;
        else
            shipParts(i,10) = 10;
        end
    end
    if (ships(i,10) == 3)
        if (ships(i,9) == 3)
            shipParts(i,10) = 9;
        elseif (ships(i+1,10) == 3) && (ships (i-1,10) == 3)
            shipParts(i,10) = 11;
        elseif (ships(i+1,10) == 3) && (ships (i-1,10) ~= 3)
            shipParts(i,10) = 7;
        else
            shipParts(i,10) = 10;
        end
    end
    if (ships(i,10) == 4)
        if (ships(i,9) == 4)
            shipParts(i,10) = 9;
        elseif (ships(i+1,10) == 4) && (ships (i-1,10) == 4)
            shipParts(i,10) = 11;
        elseif (ships(i+1,10) == 4) && (ships (i-1,10) ~= 4)
            shipParts(i,10) = 7;
        else
            shipParts(i,10) = 10;
        end
    end
    if (ships(i,10) == 5)
        if (ships(i,9) == 5)
            shipParts(i,10) = 9;
        elseif (ships(i+1,10) == 5) && (ships (i-1,10) ~= 5)
            shipParts(i,10) = 7;
        else
            shipParts(i,10) = 10;
        end
    end
end
for a= 1:10
    
for i = 1:10
   if shipParts(a,i)==8
       shipParts(a,i) = 3;
   elseif shipParts(a,i) == 6
       shipParts(a,i) = 4;
   elseif shipParts(a,i) == 9
       shipParts(a,i) = 5;
   elseif shipParts(a,i) == 7
       shipParts(a,i) = 6;
   elseif shipParts(a,i) == 11
       shipParts(a,i) = 7;
   elseif shipParts(a,i)== 10
       shipParts(a,i) = 8;
   end
       
       
       
    
    
end
end
end
