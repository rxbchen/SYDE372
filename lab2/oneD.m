mean1 = mean(al);
covariance = cov(al);

mean2 = mean(bl);
covariance2 = cov(bl);

mean3 = mean(cl);
covariance3 = cov(cl);

R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);
y = normpdf(x, mean1, stand);
%plot(x,y);
%hold on;
histogram(b, 'Normalization', 'probability');
hold on;
sum = zeros(1,101);
for i = 1:length(b)
    sum = sum + normpdf(x, b(i), 0.1);
end
sum = sum / length(b);
plot(x,sum);
hold on;
plot(x,y,'k');
