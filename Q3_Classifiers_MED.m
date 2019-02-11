mu_a = [5 10];
mu_b = [10 15];
mu_c = [5 10];
mu_d = [15 10];
mu_e = [10 5];

[m_de, b_de, isVertical_de] = MED(mu_d, mu_e);
[m_ce, b_ce, isVertical_ce] = MED(mu_c, mu_e);

figure; hold on;
x1 = linspace(10,25);
z = m_de*x1 + b_de;
plot(x1,z);
x2 = linspace(-5,10);
z = m_ce*x2 + b_ce;
plot(x2,z);
% CD STUFF
plot([10 10], [10 25]);
% end

% fprintf('The m value is: %i\n', m_cd);
% fprintf('The b value is: %i\n', b_cd);
