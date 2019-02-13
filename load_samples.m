%Case 1
%Class A
mu_a = [5 10];
N_a = 200;
sigma_a = [8 0; 0 4];
class_a = generate_samples(mu_a, N_a, sigma_a);
[e_val_a, e_vec_a, angle_a] = calc_stddev_contour(sigma_a);

% Class B
mu_b = [10 15];
N_b = 200;
sigma_b = [8 0; 0 4];
class_b = generate_samples(mu_b, N_b, sigma_b);
[e_val_b, e_vec_b, angle_b] = calc_stddev_contour(sigma_b);

% Generate range for later use
x1_range = (min([class_a(:,1); class_b(:,1)])-1 : 0.1 : max([class_a(:,1); class_b(:,1)])+1);
y1_range = (min([class_a(:,2); class_b(:,2)])-1 : 0.1 : max([class_a(:,2); class_b(:,2)])+1);
[X1_pt, Y1_pt] = meshgrid(x1_range, y1_range);

%Case 2
%Class C
mu_c = [5 10];
N_c = 100;
sigma_c = [8 4; 4 40];
class_c = generate_samples(mu_c, N_c, sigma_c);
[e_val_c, e_vec_c, angle_c] = calc_stddev_contour(sigma_c);

% Class D
mu_d = [15 10];
N_d = 200;
sigma_d = [8 0; 0 8];
class_d = generate_samples(mu_d, N_d, sigma_d);
[e_val_d, e_vec_d, angle_d] = calc_stddev_contour(sigma_d);

% Class E
mu_e = [10 5];
N_e = 150;
sigma_e = [10 -5; -5 20];
class_e = generate_samples(mu_e, N_e, sigma_e);
[e_val_e, e_vec_e, angle_e] = calc_stddev_contour(sigma_e);

% Generate Range for later use
x2_range = (min([class_c(:,1); class_d(:,1); class_e(:,1)])-1 : 0.1: max([class_c(:,1); class_d(:,1); class_e(:,1)])+1);
y2_range = (min([class_c(:,2); class_d(:,2); class_e(:,2)])-1 : 0.1: max([class_c(:,2); class_d(:,2); class_e(:,2)])+1);
[X2_pt, Y2_pt] = meshgrid(x2_range, y2_range);