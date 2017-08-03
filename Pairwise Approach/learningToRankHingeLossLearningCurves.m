close all; clear; clc;

% [y qid X] = loadData('train.txt');
% [m n] = size(X);
% [X mu sigma] = featureNormalize(X);
% X = [ones(m, 1) X];
% D = [y qid X];
% [XX yy] = GetXFromRandomPairs(D, 2000);
[XX yy mu sigma] = GetAllPairs('train.txt');
[XX_t yy_t mu_t sigma_t] = GetAllPairs('train.txt');
[m n] = size(XX);

w = zeros(n, 1);

lambda = 0.01;
t = 200;
alpha = 0.01;

div = 10;

error_train = zeros(div, 1);
error_test  = zeros(div, 1);

partSize = floor(m / div);

for s = 1:div
	for i = 1:t

		[loss grad] = HingeLoss(w, XX(1:s * partSize, :), yy(1:s * partSize), lambda);
		
		w = w - alpha * grad;

	end
	
	error_train(s) = HingeLoss(w, XX(1:s * partSize, :), yy(1:s * partSize), lambda);;
	error_test(s)  = HingeLoss(w, XX_t, yy_t, lambda);
	
end

% plotConvergence(error_train, 1);

figure;
plot(1:1:1 * size(error_train', 2), error_train', '-b', 'LineWidth', 2);
hold on
plot(1:1:1 * size(error_test',  2), error_test',  '-y', 'LineWidth', 2);
hold off