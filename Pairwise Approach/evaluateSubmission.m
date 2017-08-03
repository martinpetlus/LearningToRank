function [Err, nDCG] = evaluateSubmission(labels, ranks, k)

%% Script to compute the NDCG and ERR scores.
%   Labels is a column vector containing the relevance labels
%   Ranks is a column vector containing the predicted ranks
%   k is the truncation level for NDCG
%   It returns the ERR and NDCG

if ~exist('k', 'var') || isempty(k)
	k = 10;
end

if length(labels) != length(ranks)
	fprintf(['Error: Different number of documents in' ...
			'labels vector and ranks vector\n']);
end

nd = length(labels);	% Number of documents

Err = 0.0;
nDCG = 0.0;

gains = -1 * ones(nd, 1);

if max(ranks) > nd
	fprintf('Error: Ranks larger than number of documents\n');
end

for i = 1:nd
	gains(ranks(i)) = (2 ** labels(i) - 1.0) / 16;
end

if min(gains) < 0
	fprintf('Not all ranks presented');
end

p = 1.0;

for i = 1:nd
	r = gains(i);
	Err += (r * p) / i;
	p *= 1 - r;
end

DCG = 0.0;

for i = 1:min(k, length(gains))
	DCG += gains(i) / log2(1 + i);
end

gains = sort(gains, 'descend');

idealDCG = 0.0;

for i = 1:min(k, length(gains))
	idealDCG += gains(i) / log2(1 + i);
end

if idealDCG != 0
	nDCG = DCG / idealDCG;
else	% All documents are irrelevant
	nDCG = 1.0;
end


end