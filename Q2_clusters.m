load_samples

figure
% CASE 1 %
% Scatter plot of the points
subplot(2,1,1);
hold on;
a_scatter = scatter(class_a(:,1), class_a(:,2), 'rx');
b_scatter = scatter(class_b(:,1), class_b(:,2), 'bo');

% Plot Unit stddev contour/ellipse
plot_stddev_contour(mu_a, angle_a, e_val_a, 'r');
plot_stddev_contour(mu_b, angle_b, e_val_b, 'b');
title('Samples and Unit Standard Deviation of ClassA and ClassB');
legend({'Class A','Class B'},'Location','northeast')

%MED%
x1_range = (min([class_a(:,1); class_b(:,1)])-1 : max([class_a(:,1); class_b(:,1)])+1);
y1_range = (min([class_a(:,2); class_b(:,2)])-1 : max([class_a(:,2); class_b(:,2)])+1);
[X1_pt, Y1_pt] = meshgrid(x1_range, y1_range);
MED_ab = MED(mu_a, mu_b, X1_pt, Y1_pt);
contour(X1_pt, Y1_pt, MED_ab, [0,0]);

hold off;

% CASE 2 %
subplot(2,1,2);
hold on;
c_scatter = scatter(class_c(:,1), class_c(:,2), 'rx');
d_scatter = scatter(class_d(:,1), class_d(:,2), 'bo');
e_scatter = scatter(class_e(:,1), class_e(:,2), 'g^');

%MED%
x2_range = (min([class_c(:,1); class_d(:,1); class_e(:,1)])-1 : max([class_c(:,1); class_d(:,1); class_e(:,1)])+1);
y2_range = (min([class_c(:,2); class_d(:,2); class_e(:,2)])-1 : max([class_c(:,2); class_d(:,2); class_e(:,2)])+1);
[X2_pt, Y2_pt] = meshgrid(x2_range, y2_range);
MED_cd = MED(mu_c, mu_d, X2_pt, Y2_pt);
MED_ce = MED(mu_c, mu_e, X2_pt, Y2_pt);
MED_de = MED(mu_d, mu_e, X2_pt, Y2_pt);

% Generating a combined matrix
% c = -1, d = 0, e = 1
MED_cde = zeros(size(X2_pt,1), size(Y2_pt,2));
for x=1:size(X2_pt, 1)
    for y=1:size(Y2_pt, 2)
        if(MED_cd(x,y) <= 0) && (MED_ce(x,y) <= 0)
            MED_cde(x,y) = 1;
        elseif(MED_cd(x,y) >= 0) && (MED_de(x,y) <= 0)
            MED_cde(x,y) = 2;
        elseif(MED_ce(x,y) >= 0) && (MED_de(x,y) >= 0)
            MED_cde(x,y) = 3;
        end
    end
end
contour(X2_pt, Y2_pt, MED_cde, [1,2,3], 'Color', 'cyan');


% Plot Unit stddev contour/ellipse
plot_stddev_contour(mu_c, angle_c, e_val_c, 'r');
plot_stddev_contour(mu_d, angle_d, e_val_d, 'b');
plot_stddev_contour(mu_e, angle_e, e_val_e, 'g');

title('Samples and Unit Standard Deviation of ClassC, ClassD, ClassE');
legend({'Class C','Class D', 'Class E'},'Location','northeast')
hold off;