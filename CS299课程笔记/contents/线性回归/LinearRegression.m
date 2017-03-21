
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

[X mu sigma] = featureNormalize(X)

function [X_norm, mu, sigma] = featureNormalize(X)
	% 正则化
	X_norm = X;
	mu = zeros(1, size(X, 2));
	sigma = zeros(1, size(X, 2));

	mu = mean(X);
	sigma = std(X);
	X_norm = (X - mu) ./ sigma;
end

X = [ones(m, 1) X];

alpha = 0.01;
num_iters = 400;

theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
	J_history = zeros(num_iters, 1);
	for iter = 1:num_iters
	    predict = X * theta;
	    theta = theta - alpha/m * X' * (predict - y); 
	    J_history(iter) = computeCostMulti(X, y, theta);
	end
end

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');








