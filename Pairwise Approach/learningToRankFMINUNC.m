close all; clear; clc;

% [y qid X] = loadData('train.txt');
% [m n] = size(X);
% [X mu sigma] = featureNormalize(X);
% X = [ones(m, 1) X];
% D = [y qid X];
lambda = 0.01;

% [XX yy] = GetXFromRandomPairs(D, 1000);
% initial_w = zeros(n + 1, 1);
[XX yy mu sigma] = GetAllPairs('train3.txt');
[m n] = size(XX);
initial_w = zeros(n, 1);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[w, loss, exit_flag] = fminunc(@(t)(HingeLoss(t, XX, yy, lambda)),
							   initial_w, options);
									
% SquaredLossFMINUNC(initial_w, X, y, lambda)
% w2 = normalEqn(X, y);
% fprintf('Loss (normal equation) = %f\n', SquaredLossFMINUNC(w2, X, y, lambda));