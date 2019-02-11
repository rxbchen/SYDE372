function [distance] = euclidian_distance(p1, p2)
%EUCLIDIAN_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
distance = sqrt((p1(:,1) - p2(:,1)).^2 - (p1(:,2)-p2(:,2).^2));
end
