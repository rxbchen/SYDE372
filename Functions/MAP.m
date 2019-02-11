function matrix = MAP(meanA, meanB, covA, covB, numA, numB, X, Y) 
    sigmaA = [covA(1,1),covA(2,2)];
    sigmaB = [covB(1,1),covB(2,2)];
    probabilityA = numA/(numA + numB);
    probabilityB = numB/(numA + numB);
    meanA = meanA';
    meanB = meanB';
    
    matrix = zeros(size(X,1),size(Y,2));
    
    Q0 = inv(covA) - inv(covB);
    Q1 = 2*((meanB'*inv(covB)) - (meanA'*inv(covA)));
    Q2 = meanA'*inv(covA)*meanA - meanB'*inv(covB)*meanB; 
    Q3 = log(probabilityB/probabilityA);
    Q4 = log(det(covA)/det(covB));
    
    for i = 1:size(X,1)
        for j = 1:size(Y,2)
           x = [X(i,j),Y(i,j)];
           x = x';
           matrix(i,j) = x'*Q0*x + Q1*x + Q2 + 2*Q3 + Q4;
        end
    end
    
    %display(sigmaA + "," + sigmaB + "," + probabilityA + "," + probabilityB);
    
    %secondOrder = (([1,1]/sigmaB.^2) - ([1,1]/sigmaA.^2));
    %firstOrder = -2*((meanB/sigmaB.^2) - (meanA/sigmaA.^2));
    %zeroOrder = (meanB.^2/sigmaB.^2 - meanA.^2/sigmaA.^2 - 2*log((sigmaA*probabilityB)/(sigmaB*probabilityA)));
end
    