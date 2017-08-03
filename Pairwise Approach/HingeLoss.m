function [loss, grad] = HingeLoss(w, X, y, lambda)

	[num_pairs n] = size(X);
	
	loss = (lambda / 2) * (w' * w) + (1 / num_pairs) * sum( max(0, 1 - bsxfun(@times, X, y) * w) ); 
	
	z = y .* (X * w);
	z = z < 1;
	
	_w = [0 ; w(2:end)];
	
	grad = lambda * _w + (1 / num_pairs) * sum( bsxfun(@times, bsxfun(@times, X, -y), z) )';

end