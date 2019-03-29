clear all; 
load('C:\Users\ajplee\Downloads\lab2_3 (1).mat');

J = 5;
a_original = a;
b_original = b;

% Define range
x2_range = (min([a(:,1); b(:,1)])-1 : 1: max([a(:,1); b(:,1)])+1);
y2_range = (min([a(:,2); b(:,2)])-1 : 1: max([a(:,2); b(:,2)])+1);
[X2_pt, Y2_pt] = meshgrid(x2_range, y2_range);

nab = ones(J, 1);
nba = ones(J, 1);
miss_class = zeros(J,1);

hold on;
a_scatter = scatter(a(:,1), a(:,2), 'rx');
b_scatter = scatter(b(:,1), b(:,2), 'bo');

for j = 1:J
    limit = 20;
    while ~isempty(a) && ~isempty(b) && (nab(j) ~= 0 || ~(length(a) == length(a_original))) && (nba(j) ~= 0 || ~(length(b) == length(b_original))) && limit ~= 0
        % Pick rando pt
        rand_a = a(randi(length(a)), :);
        rand_b = b(randi(length(b)), :);

        med_ab = MED(rand_a, rand_b, X2_pt, Y2_pt);
        % Loop thru points
        nab(j)=0;
        for i = 1:length(a)
            if interp2(X2_pt, Y2_pt, med_ab, a(i,1), a(i,2)) > 0
                nab(j, 1) = nab(j, 1) + 1;
            end            
        end
        
        nba(j)=0;
        for i = 1:length(b)
            if interp2(X2_pt, Y2_pt, med_ab, b(i,1), b(i,2)) < 0
                nba(j, 1) = nba(j, 1) + 1;
            end
        end
        limit = limit - 1;
        display(limit);
    end
    if limit == 0 && (nab(j) ~= 0 || ~(length(a) == length(a_original))) && (nba(j) ~= 0 || ~(length(b) == length(b_original)))
        j = j - 1;
    elseif limit ~= 0
        contour(X2_pt, Y2_pt, med_ab, [0,0]);
    end
    miss_class(j, 1) = nab(j) + nba(j);
    a_new = [];
    b_new = [];
    %Conditions added due to possibility of reaching the limit of J
    if (nab(j) == 0) 
        for i = 1:length(b)
            if interp2(X2_pt, Y2_pt, med_ab, b(i,1), b(i,2)) < 0
                b_new = cat(1, b_new, b(i,:));
            end            
        end
        b = b_new;
    end
    
    if (nba(j) == 0)
        for i = 1:length(a)
            if interp2(X2_pt, Y2_pt, med_ab, a(i,1), a(i,2)) > 0
                a_new = cat(1, a_new, a(i,:));
            end
        end
        a = a_new;
    end
end


