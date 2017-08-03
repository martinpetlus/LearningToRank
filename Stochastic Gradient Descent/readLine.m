function [y qid x] = readLine(fid)

if !feof(fid)

	line = fgets(fid);
	[y qid cnt] = sscanf(line, "%d qid:%d", "C");
	
	line = substr(line, 6);
	[tmp line] = strtok(line, ' ');
	line = strtrim(line);
	
	[x cnt] = sscanf(line, '%*d:%f', Inf);
	
end

end