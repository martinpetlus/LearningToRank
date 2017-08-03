function [min max] = findMinAndMax(fileName, min, max)

fid = fopen(fileName);

[y qid x] = readLine(fid);

min = x;
max = x;

while !feof(fid)

	[y qid x] = readLine(fid);
	
	for i = 1:size(x, 1)
		
		if x(i) < min(i)
			min(i) = x(i);
		end
		
		if x(i) > max(i)
			max(i) = x(i);
		end
		
	end
	
end

fclose(fid);

end