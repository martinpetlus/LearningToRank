clear; close all; clc

fid = fopen('train.txt');

alpha = 4.122;

theta = zeros(137, 1);

num_iters = 10;

[theta m min max] = stochasticGradientDescent(theta, alpha, num_iters, fid);

fprintf('J = %f\n', computeStochasticCost(theta, min, max, 'train.txt'));

% [y qid X] = loadData('train.txt');

% X = bsxfun(@minus, X, min');
% X = bsxfun(@rdivide, X, (max - min)');

% X = [ones(m, 1) X];

% theta2 = zeros(137, 1);
% theta2 = gradientDescent(X, y, theta2, 0.01, 400)

% fprintf('J = %f\n', computeCost(X, y, theta2));

fprintf('[ %f ]\n', sort(theta, 'descend'));
fprintf('m = %d\n', m);

fclose(fid);
