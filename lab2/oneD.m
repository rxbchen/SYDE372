


R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);
y = exppdf(x, 1);
%plot(x,y);
%hold on;
histogram(b, 'Normalization', 'pdf');
hold on;
sum = zeros(1,101);
for i = 1:length(b)
    sum = sum + normpdf(x, b(i), 0.1);
end
sum = sum / length(b);
plot(x,sum);
hold on;
plot(x,y,'k');

ylabel('Y');
xlabel('X');
legend('Sample Data', 'Estimated Density SD(0.1)', 'True Density');