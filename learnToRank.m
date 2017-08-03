clear; close all; clc

fprintf('Loading data ...\n');

[y, qid, X] = loadData('train.txt');

fprintf('End loading data ...\n');
fprintf('Press Enter to continue ...\n');

pause;

alpha = 0.01;		% Learning rate
[m n] = size(X); 	% m is number of training examples, n is number of features

% Scale features and set them to zero mean
[X mu sigma] = featureNormalize(X);

theta = zeros(n + 1, 1);

% Nuber of iterations
num_iters = 400;

% Add column of ones
X = [ones(m, 1) X];

% Run Gradient descent
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% fprintf("[ %f ]\n", J_history);

featureNames = loadFeatureNames();

[s idx] = sort(theta(2:end), 'descend');
for i = 1:n
	fprintf('w = %f\t%s\n', s(i), featureNames{idx(i)});
end
fprintf('\n');

J = computeCost(X, y, theta);
fprintf(" J = %f\n\n", J);

evaluateTheta(theta, mu, sigma);

theta = normalEqn(X, y);
J = computeCost(X, y, theta);
fprintf('Theta computed from the normal equations\n\n');
fprintf(" J = %f\n\n", J);

evaluateTheta(theta, mu, sigma);