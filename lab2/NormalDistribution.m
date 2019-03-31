
R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);

%plot(x,y);
%hold on;
histogram(b, 'Normalization', 'pdf');
hold on;

sum = normpdf(x,mean(b), std(b));
y = exppdf(x,1);

plot(x,y,'k');
plot(x,sum);

ylabel('Y');
xlabel('X');
legend('Sample Data', 'True Density', 'Gaussian Parametric Estimation');