function [distance] = euclidian_distance(p1, mean)
%EUCLIDIAN_DISTANCE Summary of this function goes here
distance = sqrt((p1 - mean) * transpose(p1 - mean));
end
