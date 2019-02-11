

function[dist_map] = NN(k, samples_a, sample_b, X, Y)
    dist_map = zeros(size(X,1), size(Y,2));
    for x = 1:size(X,1)
        for y = 1:size(Y,2)
            coordinate = [X(x,y), Y(x,y)];
            dist_map(x,y) = distanceCalc(k, samples_a, sample_b, coordinate);
        end
    end
    
end


function [dist] = distanceCalc(k, sample_a, sample_b, dataPoint)
    distance_a = realmax;
    distance_b = realmax;
    
    if k==1
       for classIndex_1 = 1:length(sample_a)
           a_pt = sample_a(classIndex_1, :);
           distance_a =  min(distance_a, sqrt( (dataPoint(1)- a_pt(1))^2 + (dataPoint(2)- a_pt(2))^2));
       end
       
       for classIndex_2 = 1:length(sample_b)
           b_pt = sample_b(classIndex_2, :);
           distance_b = min(distance_b, sqrt( (dataPoint(1)-b_pt(1))^2 + (dataPoint(2)-b_pt(2))^2));
       end
          
    else
        % nx3 matrix created based on coordinates of sample points and
        % respective euclidean distance to dataPoint
        minVal_a = zeros(length(sample_a), 3);
        minVal_b = zeros(length(sample_b), 3);
        
        for classIndex_1 = 1: length(sample_a)
           a_pt = sample_a(classIndex_1, :);
           distance_a =  sqrt((dataPoint(1)-a_pt(1))^2 + (dataPoint(2)-a_pt(2))^2);
           minVal_a(classIndex_1, :) = [a_pt(1), a_pt(2), distance_a];
        end
        
        for classIndex_2 = 1:length(sample_b)
           b_pt = sample_b(classIndex_2, :);
           distance_b =  sqrt((dataPoint(1)- b_pt(1))^2 + (dataPoint(2)- b_pt(2))^2);
           minVal_b(classIndex_2, :) = [b_pt(1), b_pt(2), distance_b];
        end
        
        sort_A = sortrows(minVal_a, 3);
        sort_B = sortrows(minVal_b, 3);
        
        % Sample Mean 
        mean_a = mean(sort_A(1:k,[1,2]));
        mean_b = mean(sort_B(1:k,[1,2]));
        
        distance_a = sqrt((dataPoint(1)-mean_a(1))^2 + (dataPoint(2)-mean_a(2))^2);
        distance_b = sqrt((dataPoint(1)-mean_b(1))^2 + (dataPoint(2)-mean_b(2))^2);
    end
    dist = distance_a - distance_b;  
end        
