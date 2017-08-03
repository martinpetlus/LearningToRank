function [theta m min max] = stochasticGradientDescent(theta, alpha, num_iters, fid)

i = 0;

[mi ma] = findMinAndMax('train.txt');

min = mi;
max = ma;

for iter = 1:num_iters
	while (!feof(fid))

		[y qid x] = readLine(fid);
		
		x = x - min;
		x = x ./ (max - min);

		x = [1 ; x];
		
		i++;
		
		eta = 1 / (i * alpha);
		
		theta = theta - eta * (((x' * theta) - y) * x);

	end
	
	m = i;
	i = 0;
	frewind(fid);
end

end