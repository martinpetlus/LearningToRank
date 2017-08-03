close all; clear; clc;

[y qid X] = loadData('train.txt');
[m n] = size(X);
[X mu sigma] = featureNormalize(X);
X = [ones(m, 1) X];
D = [y qid X];

alpha = 200;
t = 10000;
w = zeros(n + 1, 1);
pairs = zeros(t, 2);

plotExamples = 100;
Loss_history = zeros(t / plotExamples, 1);
sum = 0;

% P = CreateIndex(D);

for i = 1:t

	[a ya b yb idxa idxb] = GetRandomPair(D);
	
	pairs(i, 1) = idxa;
	pairs(i, 2) = idxb;
	
	x  = a  -  b;
	x(1) = 1;
	yy = sign(ya - yb);
	
	sum += loss(w, x, yy);
	
	if (mod(i, plotExamples) == 0)
		Loss_history(i / plotExamples) = sum / plotExamples;
		sum = 0;
	end
	
	eta = 1 / (i * alpha);
	
	w = StochasticGradientStep(w, x, yy, eta);
	
end

plotConvergence(Loss_history, plotExamples);

fprintf(' [ %f ]\n', w);
fprintf('Loss = %f\n', SquaredLossFunction(w, X, y, pairs));
w = zeros(n + 1, 1);
fprintf('Loss = %f\n', SquaredLossFunction(w, X, y, pairs));
