



function Entity_Check(type)
	if type == "transport-belt" then return false
	elseif type == "splitter" then return false
	elseif type == "container" then return false
	elseif type == "character" then return false
	elseif type == "electric-pole" then return false
	elseif type == "inserter" then return false
	elseif type == "pipe" then return false
	elseif type == "lamp" then return false
	elseif type == "pipe-to-ground" then return false
	elseif type == "underground-belt" then return false
	elseif type == "loader" then return false
	elseif type == "loader-1x1" then return false
	elseif type == "car" then return false
	elseif type == "rail-signal" then return false
	elseif type == "rail-chain-signal" then return false
	elseif type == "locomotive" then return false
	elseif type == "cargo-wagon" then return false
	elseif type == "straight-rail" then return false
	elseif type == "curved-rail" then return false
	else return true
	end
end

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function getDistance(objA_X, objA_Y, objB_X, objB_Y)
    -- Get the length for each of the components x and y
    local xDist = objB_X - objA_X
    local yDist = objB_Y - objA_Y

    return math.sqrt((xDist^2)+(yDist^2)) 
end
