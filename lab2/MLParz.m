function matrix = MLParz(p_A, p_B, x, y) 
   % probabilityA = numA/(numA + numB);
   % probabilityB = numB/(numA + numB);
    
    matrix = zeros(size(x,2),size(y,2));
    

    
    for i = 1:size(x,2)
        for j = 1:size(y,2)
           matrix(i,j) = p_A(i,j) - p_B(i,j);
        end
    end
end