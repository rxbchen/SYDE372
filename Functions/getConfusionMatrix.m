function confusion = getConfusionMatrix(matrix, classA, classB)
    
    confusion = zeros(2,2);
    minA = min([classA(:,1);classB(:,1)]);
    minB = min([classA(:,2);classB(:,2)]);
    maxA = max([classA(:,1);classB(:,1)]);
    maxB = max([classA(:,2);classB(:,2)]);
    
    minX = 1;
    minY = 1;
    maxX = size(matrix,1);
    maxY = size(matrix,2);
    
    a = (maxA - minA)/(maxX - minX);
    b = maxA - a*maxX;
    
    display(a + "," + b)
    
    c = (maxB - minB)/(maxY - minY);
    d = maxB - c*maxY;
    
    for i = 1:size(classA,1)
        first = min(max(round((classA(i,1) - b)/a),1), maxX);
        second = min(max(round((classA(i,2)-d)/c),1), maxY);
       
        if(matrix(first, second) >= 0)
            confusion(1,1) = confusion(1,1) + 1;
        else
            confusion(1,2) = confusion(1,2) + 1;
        end
    end
    
    for i = 1:size(classB,1)
        firstB = min(max(round((classB(i,1) - b)/a),1), maxX);
        secondB = min(max(round((classB(i,2)-d)/c),1), maxY);
        
        if(matrix(firstB, secondB) < 0)
            confusion(2,2) = confusion(2,2) + 1;
        else
            confusion(2,1) = confusion(2,1) + 1;
        end
    end
end

