%Case 1
%Class A
mu_a = [5 10];
N_a = 200;
sigma_a = [8 0; 0 4];
class_a = sample_calc(mu_a, N_a, sigma_a);
[e_val_a, e_vec_a, angle_a] = calc_stddev_contour(sigma_a);

% Class B
mu_b = [10 15];
N_b = 200;
sigma_b = [8 0; 0 4];
class_b = sample_calc(mu_b, N_b, sigma_b);
[e_val_b, e_vec_b, angle_b] = calc_stddev_contour(sigma_b);

%Case 2
%Class C
mu_c = [5 10];
N_c = 100;
sigma_c = [8 4; 4 40];
class_c = sample_calc(mu_c, N_c, sigma_c);
[e_val_c, e_vec_c, angle_c] = calc_stddev_contour(sigma_c);

% Class D
mu_d = [15 10];
N_d = 200;
sigma_d = [8 0; 0 8];
class_d = sample_calc(mu_d, N_d, sigma_d);
[e_val_d, e_vec_d, angle_d] = calc_stddev_contour(sigma_d);

% Class E
mu_e = [10 5];
N_e = 150;
sigma_e = [10 -5; -5 20];
class_e = sample_calc(mu_e, N_e, sigma_e);
[e_val_e, e_vec_e, angle_e] = calc_stddev_contour(sigma_e);