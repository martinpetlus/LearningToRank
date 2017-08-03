function J = computeStochasticCost(theta, min, max, fileName)

fid = fopen(fileName);

sum = 0;
m = 0;

while !feof(fid)

	[y qid x] = readLine(fid);
	
	x = x - min;
	x = x ./ (max - min);

	x = [1 ; x];
	
	sum += ((x' * theta) - y) ** 2;
	
	m++;

end

J = (1 / (2 * m)) * sum;

fclose(fid);

end