function plot_s_transfer(h_analog, w1, w2, filename)
	% default filename
	if ~exist('filename','var')
		filename = 'Analog_Filter';
	end
	syms s
	
	% get the numerator and denominator polynomials
	[num, den] = numden(vpa(h_analog));
    fact = coeffs(den);
	% normalize coefficients
    num = num / fact(end);
    den = den / fact(end);
	% convert symbolic to polynomials for plotting
	num_coeffs = sym2poly(vpa(num));
	den_coeffs = sym2poly(vpa(den));
	
	%Plot Bode plot of Transfer Function
	figure;
	freqs(num_coeffs,den_coeffs);
	saveas(gcf, strcat(pwd,'\Plots\',filename,'_Magn_Phase.svg'));
	
	%Plot Magnitude of Frequency Response
	w = w1:(w2-w1)/2000:w2;
	[h,w] = freqs(num_coeffs,den_coeffs, w);
	figure;
	semilogx(w,abs(h));
	grid on;
	xlabel('Frequency')
	ylabel('Magnitude')
	title(strcat(filename,'Magnitude of Frequency Response'));
	saveas(gcf, strcat(pwd,'\Plots\',filename,'_Magnitude.svg'));
	
	%% Plotting Phase and Magnitude(dB)
	% figure;
	% semilogx(w,angle(h)*180/pi)
	% grid on;
	% xlabel('Frequency')
	% ylabel('Phase')
	% title(strcat(filename,'Phase of Frequency Response'));
	% saveas(gcf, strcat(filename,'_Phase.svg'));
	
	% figure;
	% semilogx(w, 20*log10(abs(h)));
	% xlabel('Frequency')
	% grid on;
	% ylabel('Magnitude (dB)')
	% title(strcat(filename,'Magnitude of Frequency Response'));
	% saveas(gcf, strcat(filename,'_MagnitudeDB.svg'));
end