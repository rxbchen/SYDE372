function confusion = getConfusionMatrix3(matrix, classA, classB, classC)
    
    confusion = zeros(3,3);
    minA = min([classA(:,1);classB(:,1);classC(:,1)]);
    minB = min([classA(:,2);classB(:,2);classC(:,2)]);
    maxA = max([classA(:,1);classB(:,1);classC(:,1)]);
    maxB = max([classA(:,2);classB(:,2);classC(:,2)]);
    
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
        first = min(max(round((classA(i,1)- b)/ a) ,1), maxX);
        second = min(max(round((classA(i,2)-d)/ c),1), maxY);
        %display((classA(i,1)*a + b) + "," + ((classA(i,2)*c) + d));
        if(matrix(first, second) == 1)
            confusion(1,1) = confusion(1,1) + 1;
        elseif(matrix(first, second) == 2) 
            confusion(1,2) = confusion(1,2) + 1;
        elseif(matrix(first, second) == 3) 
            confusion(1,3) = confusion(1,3) + 1;
        end
    end
    
    for i = 1:size(classB,1)
         firstB = min(max(round((classB(i,1)- b)/ a) ,1), maxX);
        secondB = min(max(round((classB(i,2)-d)/ c),1), maxY);
         %firstB = min(max(round((classB(i,1)*a) + b),1), maxX);
        %secondB = min(max(round((classB(i,2)*c) + d),1), maxY);
        
         if(matrix(firstB, secondB) == 2)
            confusion(2,2) = confusion(2,2) + 1;
        elseif(matrix(firstB, secondB) == 1) 
            confusion(2,1) = confusion(2,1) + 1;
        elseif(matrix(firstB, secondB) == 3) 
            confusion(2,3) = confusion(2,3) + 1;
        end
    end
    
    for i = 1:size(classC,1)
         firstC = min(max(round((classC(i,1)- b)/ a) ,1), maxX);
        secondC = min(max(round((classC(i,2)-d)/ c),1), maxY);
       %  firstC = min(max(round((classC(i,1)*a) + b),1), maxX);
        %secondC = min(max(round((classC(i,2)*c) + d),1), maxY);
        
        if(matrix(firstC, secondC) == 3)
            confusion(3,3) = confusion(3,3) + 1;
        elseif(matrix(firstC, secondC) == 1) 
            confusion(3,1) = confusion(3,1) + 1;
        elseif(matrix(firstC, secondC) == 2) 
            confusion(3,2) = confusion(3,2) + 1;
        end
    end
    
    display(confusion(1,1));
    display(confusion(2,2));
    display(confusion(3,3));
    
end

