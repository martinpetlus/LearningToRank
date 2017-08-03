function [y qid X] = loadData(fileName)

	y   = [];	% column vector of revelance labels
	qid = [];	% column vector of query ids
	X   = [];	% matrix with features

	fid = fopen(fileName);

	while (not(feof(fid)))

		line = fgets(fid);
		
		[yAux qidAux cnt] = sscanf(line, '%d qid:%d', 'C');
		
		y   = [y ; yAux];
		qid = [qid ; qidAux];
		
		line = substr(line, 6);
		[tmp line] = strtok(line, ' ');
		line = strtrim(line);
		
		[XAux cnt] = sscanf(line, '%*d:%f', Inf);
		
		X = [X ; XAux'];
		
	end

	fclose(fid);

end