
R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);

%plot(x,y);
%hold on;
histogram(b, 'Normalization', 'pdf');
hold on;

sum = (1/mean(b))*exppdf(x,1/mean(b));
y = exppdf(x,1);

plot(x,y,'k');
plot(x,sum);

ylabel('Y');
xlabel('X');
legend('Sample Data', 'True Density', 'Exponential Parametric Estimation');