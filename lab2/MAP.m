function matrix = MAP(meanA, meanB, covA, covB, X, Y) 
   % probabilityA = numA/(numA + numB);
   % probabilityB = numB/(numA + numB);
    
    matrix = zeros(size(X,1),size(Y,2));
    
    Q0 = inv(covA) - inv(covB);
    Q1 = 2*((meanB*inv(covB)) - (meanA*inv(covA)));
    Q2 = meanA*inv(covA)*meanA' - meanB*inv(covB)*meanB'; 
    Q3 = 0;%log(probabilityB/probabilityA);
    Q4 = log(det(covA)/det(covB));
    
    for i = 1:size(X,1)
        for j = 1:size(Y,2)
           x = [X(i,j),Y(i,j)];
           matrix(i,j) = x*Q0*x' + Q1*x' + Q2 + 2*Q3 + Q4;
        end
    end
end