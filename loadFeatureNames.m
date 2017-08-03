function featureNames = loadFeatureNames()

fid = fopen('feature_names.txt');

n = 136;	% Total number of features

featureNames = cell(n, 1);

for i = 1:n

	line = fgets(fid);
	[idx, featureName] = strtok(line, ' ');
	featureNames{i} = strtrim(featureName);
	
end

fclose(fid);

end