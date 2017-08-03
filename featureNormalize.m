function [X_norm, mu, sigma] = featureNormalize(X)


mu = mean(X);	% Compute mean value
X_norm = bsxfun(@minus, X, mu);	% Subtract mean value from features

sigma = std(X_norm);	% Compute standard deviation
X_norm = bsxfun(@rdivide, X_norm, sigma);	% Divide features by std


end