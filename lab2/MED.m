function [distances] = MED(mu1, mu2, X_pt, Y_pt)
    % Create a matrix of zeros to record the distances
    % Since X_pt and Y_pt will always be equal
    % Only need to look at one of them
    distance_matrix = zeros(size(X_pt,1), size(Y_pt,2));
    
    for x=1:size(X_pt, 1)
        for y=1:size(Y_pt, 2)
            pt = [X_pt(x, y) Y_pt(x, y)];
            distance_matrix(x, y) = euclidian_distance(pt, mu1) - euclidian_distance(pt, mu2);
        end
    end
    
    distances = distance_matrix;
end
