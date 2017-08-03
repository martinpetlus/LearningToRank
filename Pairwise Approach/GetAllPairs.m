function [_X _y mu sigma] = GetAllPairs(fileName)

	[y qid X] = loadData(fileName);
	[X mu sigma] = featureNormalize(X);
	[m n] = size(X);
	
	qids = union(qid, qid);
	num_qids = length(qids);
	
	mm = zeros(num_qids, 1);
	_m = 0;
	
	for i = 1:num_qids
		mm(i) = sum(qid == qids(i));
		_m += mm(i) * mm(i) - mm(i);
	end
	
	_X = zeros(_m, n);
	_y = zeros(_m, 1);
	
	idx = 1;
	docs = 0;
	
	for q = 1:num_qids
		for i = 1:mm(q)
			for j = 1:mm(q)
			
				if i == j
					continue;
				end
				
				_X(idx, :) = X(i + docs, :) - X(j + docs, :);
				_y(idx) = sign(y(i + docs) - y(j + docs));
				
				idx += 1;
	
			end
		end
		
		docs += mm(q);
	end
	
	_X = [ones(_m, 1) _X];

end