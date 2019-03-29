
R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);

%plot(x,y);
%hold on;
histogram(a, 'Normalization', 'probability');
hold on;

sum = normpdf(x,mean(a), std(a));
y = normpdf(x,5,1);

plot(x,y,'k');
plot(x,sum);

ylabel('Y');
xlabel('X');
legend('Sample Data', 'True Density', 'Gaussian Parametric Estimation');