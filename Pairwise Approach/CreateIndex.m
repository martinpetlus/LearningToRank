function P = CreateIndex(D)

	P = struct();

	y   = D(:, 1);
	qid = D(:, 2);
	X   = D(:, 3:end);
	
	[m n] = size(X);
	
	for i = 1:m
	
		queryIDName = strcat('q', num2str(qid(i)));
		
		if (not(isfield(P, queryIDName)))
			P = setfield(P, queryIDName, struct());
		end
		
		yName = strcat('y', num2str(y(i)));
		
		if (not(isfield(P.(queryIDName), yName)))
			P.(queryIDName) = setfield(P.(queryIDName), yName, []);
		end
		
		P.(queryIDName).(yName) = [P.(queryIDName).(yName) ; X(i, :)];
	
	end

end