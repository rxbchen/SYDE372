mu_c = mean(al);
sigma_c = cov(al);

mu_d = mean(bl);
sigma_d = cov(bl);

mu_e = mean(cl);
sigma_e = cov(cl);

x2_range = (min([al(:,1); bl(:,1); cl(:,1)])-0.5 : 0.5: max([al(:,1); bl(:,1); cl(:,1)])+1);
y2_range = (min([al(:,2); bl(:,2); cl(:,2)])-1.5 : 0.5: max([al(:,2); bl(:,2); cl(:,2)])+1);
[X2_pt, Y2_pt] = meshgrid(x2_range, y2_range);

%MAP_cd = MAP(mu_c, mu_d, sigma_c, sigma_d, X2_pt, Y2_pt);
%MAP_ec = MAP(mu_e, mu_c, sigma_e, sigma_c, X2_pt, Y2_pt);
%MAP_de = MAP(mu_d, mu_e, sigma_d, sigma_e, X2_pt, Y2_pt);
%MAP_cde = combined_classifier(MAP_cd, MAP_de, MAP_ec, X2_pt, Y2_pt);
%contour(X2_pt, Y2_pt, MAP_cde, 'Color', 'red');

x = (min([al(:,1); bl(:,1); cl(:,1)])-1.5 : 0.5: max([al(:,1); bl(:,1); cl(:,1)])+1);
y = normpdf(x, 430, 20);
win_matrix = ones(860, 862);

for i = 1:860
    for j = 1:860
        win_matrix(i,j) = win_matrix(i,j)*y(i)*y(j);
    end
end

mu = [0 0];
Sigma = [400 0; 0 400];

X_a = mvnrnd(mu, Sigma, 100);
win_a = mvnpdf(X_a, mu, Sigma);

[p_a,x_pa,y_pa] = parzen(al, [0.5, min([al(:,1); bl(:,1); cl(:,1)]), min([al(:,2); bl(:,2); cl(:,2)])-1, max([al(:,1); bl(:,1); cl(:,1)])+1,  max([al(:,2); bl(:,2); cl(:,2)])+1], win_a);
[p_b,x_pb,y_pb] = parzen(bl, [0.5, min([al(:,1); bl(:,1); cl(:,1)]), min([al(:,2); bl(:,2); cl(:,2)])-1, max([al(:,1); bl(:,1); cl(:,1)])+1,  max([al(:,2); bl(:,2); cl(:,2)])+1], win_a);
[p_c,x_pc,y_pc] = parzen(cl, [0.5, min([al(:,1); bl(:,1); cl(:,1)]), min([al(:,2); bl(:,2); cl(:,2)])-1, max([al(:,1); bl(:,1); cl(:,1)])+1,  max([al(:,2); bl(:,2); cl(:,2)])+1], win_a);

%contourf(p_b);

Parz_ab = MLParz(p_a, p_b, x_pa, y_pa);
Parz_bc = MLParz(p_b, p_c, x_pa, y_pa);
Parz_ca = MLParz(p_c, p_a, x_pa, y_pa);
Parz_abc = combined_classifier(Parz_ab, Parz_bc, Parz_ca, x_pa, y_pa);
contourf(X2_pt, Y2_pt, Parz_abc);
