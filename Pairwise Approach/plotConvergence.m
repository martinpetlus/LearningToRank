function plotConvergence(Losses, i)

	l = Losses;

	if size(Losses,2) == 1
		l = l';
	end

	figure;
	plot(i:i:i * size(l, 2), l, '-b', 'LineWidth', 2);
	xlabel('Iterations');
	ylabel('Loss');

end