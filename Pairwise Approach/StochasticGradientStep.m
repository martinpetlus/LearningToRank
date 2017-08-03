function w = StochasticGradientStep(w, x, y, eta)
	
	% w = weight vector (model to train)
	% x = feature vector with included bias term
	% y = real value
	% eta = learning rate
	
	w = w - eta * (((x' * w) - y) * x);

end