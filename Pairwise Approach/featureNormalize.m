function [X_norm mu sigma] = featureNormalize(X)

	mu = mean(X);	% compute mean value
	X_norm = bsxfun(@minus, X, mu);	% subtract mean value from features

	sigma = std(X_norm);	% compute standard deviation
	X_norm = bsxfun(@rdivide, X_norm, sigma);	% divide features by std

end