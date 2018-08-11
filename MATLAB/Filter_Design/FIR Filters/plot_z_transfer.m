function plot_z_transfer(h_digital, samp, order, filename)
	% default filename
	if ~exist('filename','var')
		filename = 'Digital_Filter';
	end
	
	% get the numerator and denominator polynomials
	syms z
	[num, den] = numden(vpa(h_digital));
	fact = coeffs(den);
	% normalize coefficients
	num = num / fact(end);
	den = den / fact(end);
	% convert symbolic to polynomials for plotting
	num_coeffs = sym2poly(vpa(num));
	den_coeffs = sym2poly(vpa(den));

	%Plot Bode plot of Transfer Function
	figure;
	freqz(num_coeffs,den_coeffs);
	saveas(gcf, strcat(pwd,'\Plots\',filename,'_Mag_Phase.svg'));
	
	%Plot Magnitude of Frequency Response
	[h,w] = freqz(num_coeffs,den_coeffs, 'whole', 2001);
	figure;
	plot(w(1:1001,:)/pi*samp/2,(abs(h(1:1001,:))))
	grid on;
	xlabel('Frequency')
	ylabel('Magnitude')
	title(strcat(filename,'Magnitude of Frequency Response'));
	saveas(gcf, strcat(pwd,'\Plots\',filename,'_Magnitude.svg'));
	
	%% Plotting Phase and Magnitude(dB)
	% figure;
	% plot(w(1:1001,:)/pi*samp/2,(angle(h(1:1001,:))))
	% grid on;
	% xlabel('Frequency')
	% ylabel('Phase')
	% title(strcat(filename,'Phase of Frequency Response'));
	% saveas(gcf, strcat(filename,'_Phase.svg'));
	
	% figure;
	% plot(w(1:1001,:)/pi*samp/2,20*log10(abs(h(1:1001,:))))
	% xlabel('Frequency')
	% grid on;
	% ylabel('Magnitude (dB)')
	% title(strcat(filename,'Magnitude of Frequency Response'));
	% saveas(gcf, strcat(filename,'_MagnitudeDB.svg'));
	
	%% sexport data to file
	file = fopen(strcat(pwd,'\Data\',filename, '.txt'),'w');
	fprintf(file,'Order : %d', order);
	fprintf(file,'\n\n');
	fprintf(file,'Transfer Function Coefficients (Decreasing Power)\n');
	fprintf(file,'---------------------------\n');
	fprintf(file,'Nemerator Coefficients\n');
	fprintf(file,strtrim(sprintf('%d ',num_coeffs)));
	fprintf(file,'\n\n');
	fprintf(file,'Denominator Coefficients\n');
	fprintf(file,strtrim(sprintf('%d ',den_coeffs)));
	
	disp(strcat(filename,' transfer function'))
	k = z^order
	trans = poly2sym(num_coeffs,z)/(poly2sym(den_coeffs,z) * (z^order));
	trans = vpa(trans,5)
	fclose(file);
end