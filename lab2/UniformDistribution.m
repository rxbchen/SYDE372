
R = zeros(1,100);
x = 0:0.1:9.9;
%scatter(a,R);

%plot(x,y);
%hold on;
histogram(b, 'Normalization', 'pdf');
hold on;
sum = zeros(1,100);

for i = (floor(min(b))*10:max(b)*10)+1
    sum(i) = sum(i) + (1/(max(b) - min(b)));
end

y = exppdf(x,1/mean(b));

plot(x,y,'k');
plot(x,sum);

ylabel('Y');
xlabel('X');
legend('Sample Data', 'True Density', 'Uniform Parametric Estimation')
