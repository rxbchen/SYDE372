
R = zeros(1,100);
x = 0:0.1:10;
%scatter(a,R);

%plot(x,y);
%hold on;
histogram(a, 'Normalization', 'probability');
hold on;
sum = zeros(1,101);

for i = floor(min(a))*10:max(a)*10
    sum(i) = sum(i) + (1/(max(a) - min(a)));
end

y = normpdf(x,mean(a),std(a));

plot(x,y,'k');
plot(x,sum);

