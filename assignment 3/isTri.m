function valid = isTri(sides)
% input is sides = [a b c] (three sides lengths)
% output shows valid = 1 if it can form a tri, if not then 0
sides = sort(sides); % sorts small to big
valid = (sides(1) + sides(2) > sides(3)); % tri inequality 
end