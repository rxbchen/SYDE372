function confusion = getConfusionMatrix3(matrix, classA, classB, classC)
    
    confusion = zeros(3,3);
    minA = min([classA(:,1);classB(:,1);classC(:,1)]);
    minB = min([classA(:,2);classB(:,2);classC(:,2)]);
    maxA = max([classA(:,1);classB(:,1);classC(:,1)]);
    maxB = max([classA(:,2);classB(:,2);classC(:,2)]);
    
    maxX = size(matrix,1) - 1;
    maxY = size(matrix,2) - 1;
    
    a = minA*maxX/(maxA - minA);
    b = (maxA - minA)/maxX;
    
    c = minB*maxY/(maxB - minB);
    d = (maxB - minB)/maxY;
    
    for i = 1:size(classA,1)
        first = min(max(round((classA(i,1)/b) - a + 1),1), maxX + 1);
        second = min(max(round((classA(i,2)/d) - c + 1),1), maxY + 1);
       
        if(matrix(first, second) == 1)
            confusion(1,1) = confusion(1,1) + 1;
        elseif(matrix(first, second) == 2) 
            confusion(1,2) = confusion(1,2) + 1;
        elseif(matrix(first, second) == 3) 
            confusion(1,3) = confusion(1,3) + 1;
        end
    end
    
    for i = 1:size(classB,1)
        firstB = min(max(round((classB(i,1)/b) - a + 1),1), maxX + 1);
        secondB = min(max(round((classB(i,2)/d) - c + 1),1), maxY + 1);
        
         if(matrix(firstB, secondB) == 2)
            confusion(2,2) = confusion(2,2) + 1;
        elseif(matrix(firstB, secondB) == 1) 
            confusion(2,1) = confusion(2,1) + 1;
        elseif(matrix(firstB, secondB) == 3) 
            confusion(2,3) = confusion(2,3) + 1;
        end
    end
    
    for i = 1:size(classC,1)
        firstC = min(max(round((classB(i,1)/b) - a + 1),1), maxX + 1);
        secondC = min(max(round((classB(i,2)/d) - c + 1),1), maxY + 1);
        
        if(matrix(firstC, secondC) == 3)
            confusion(3,3) = confusion(3,3) + 1;
        elseif(matrix(firstC, secondC) == 1) 
            confusion(3,1) = confusion(3,1) + 1;
        elseif(matrix(firstC, secondC) == 2) 
            confusion(3,2) = confusion(3,2) + 1;
        end
    end
    
end

