close all; clear; clc;

% [y qid X] = loadData('train.txt');
% [m n] = size(X);
% [X mu sigma] = featureNormalize(X);
% X = [ones(m, 1) X];
% D = [y qid X];
% [XX yy] = GetXFromRandomPairs(D, 2000);
[XX yy mu sigma] = GetAllPairs('test.txt');
[m n] = size(XX);

w = zeros(n, 1);

lambda = 0.01;
t = 400;
alpha = 0.01;

Loss_history = zeros(t, 1);

for i = 1:t

	[loss grad] = HingeLoss(w, XX, yy, lambda);
	Loss_history(i) = loss;
	
	w = w - alpha * grad;

end

plotConvergence(Loss_history, 1);