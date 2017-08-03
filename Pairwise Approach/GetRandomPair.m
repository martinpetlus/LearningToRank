function [a ya b yb idxa idxb] = GetRandomPair(D)

	m = size(D, 1);	% number of examples
	
	rnda = unidrnd(m);	% random example a

	do
	
		rndb = unidrnd(m); % random example b
		
	until (D(rnda, 1) != D(rndb, 1)) ... % ya != yb
			&& ...
		  (D(rnda, 2) == D(rndb, 2)) 	 % qida == qidb
	
	a  = D(rnda, 3:end)';
	ya = D(rnda, 1);
	
	b  = D(rndb, 3:end)';
	yb = D(rndb, 1);
	
	idxa = rnda;
	idxb = rndb;

end