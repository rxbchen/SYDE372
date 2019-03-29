
function [matrix_out] = combined_classifier(matrix_cd, matrix2_de, matrix3_ec, X, Y)
%COMBINED_CLASSIFIER used for case 2 with 3 classifier
    b = 0;
    c = 1;
    d = 2; 
    e = 3;
    combined_cde = zeros(size(X,2), size(Y,2));
    for x=1:size(X, 2)
        for y=1:size(Y, 2)
            if(matrix_cd(x,y) == 0 && matrix3_ec(x,y) == 0 && matrix2_de(x,y) == 0)
                combined_cde(x,y) = b;
            elseif(matrix_cd(x,y) >= 0) && (matrix3_ec(x,y) <= 0)
                combined_cde(x,y) = c;
            elseif(matrix_cd(x,y) <= 0) && (matrix2_de(x,y) >= 0)
                combined_cde(x,y) = d;
            elseif(matrix3_ec(x,y) <= 0) && (matrix2_de(x,y) <= 0)
                combined_cde(x,y) = e;
            end
        end
    end
    matrix_out = combined_cde;
end