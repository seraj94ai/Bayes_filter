%setup parameters
clear
clear all
clc
actual = 55
sigma = 3	% standard deviation of noise
N = 100 		% number of samples
M = 200		%number of discrete temperature levels
figure(3)

result = zeros(1,M)
pr = ones(1,M)/100
Po = pr
nn = 1
for nn=1:100
meas = actual + normrnd(0,sigma);
norm = 0;
estimate = 0;
tmp = 0;
pr = Po
for n=1:M
    Po(n) = pr(n) * calc_pmf(meas, n,sigma);
    norm = norm + Po(n);
    if Po(n) > tmp
        tmp = Po(n);
        estimate = n;
    end
end
Po = Po / norm;
subplot(211)
hold on
plot(nn,meas,'*r')
hold on
plot(nn,estimate,'xb')
hold on
plot(nn,actual,'og')
hold on
if nn ==1
    legend({'measurment','estimate','actual'})
end
hold on
subplot(212)
plot(Po,'-r')
drawnow
end



