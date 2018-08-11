function [h_analog, order] = Bandpass_Analog(ws1, wp1, wp2, ws2, dp, ds, type)
	% check validity of the parameters
	if ~exist('type','var')
		type = 'Monotonic';
	end
	
	if(~(strcmp(type,'Monotonic') || strcmp(type,'Equiripple')))
		error('Incorrect Filter Type Arguiment');
	end
	if(~(ws1 < wp1 && wp1 < wp2 && wp2 < ws2))
		error('Must satisfy Ws1 < Wp1 < Wp2 < Ws2 to get valid filter');
	end
	% other errors are detected by ButterWorth_Analog function 
	
	% determine parameters for frequency transformation (bandpass - lowpass)
	b = wp2 - wp1;
	w0_sqr = wp1*wp2;
	
	% calculate lowpass filter specifications
	wls1 = (ws1^2 - w0_sqr)/(b*ws1);
	wls2 = (ws2^2 - w0_sqr)/(b*ws2);
	ws_l = min(abs(wls1), wls2);
	
	% get lowpass frequency response
	syms s
	if strcmp(type,'Monotonic')
		[hl_analog, lorder, wc] = ButterWorth_Analog(1, ws_l, dp, ds);
	else
		[hl_analog, lorder, eps] = Chebyshev_Analog(1, ws_l, dp, ds);
	end
	
	% using frequency transformation to get bandpass transfer function
	h_analog = subs(hl_analog, s, (s^2 + w0_sqr)/(b*s))
	order = lorder*2;
	
	%% Export Data to File %%
	file = fopen(strcat(pwd,'\Data\Bandpass_Analog.txt'),'w');
	fprintf(file, 'Filter Specifications\n');
	fprintf(file,'---------------------------\n');
	fprintf(file, 'Upper Passband Edge : %f\n', wp2);
	fprintf(file, 'Upper Stopband Edge : %f\n', ws2);
	fprintf(file, 'Lower Passband Edge : %f\n', wp1);
	fprintf(file, 'Lower Stopband Edge : %f\n', ws1);
	fprintf(file, 'Passband Tolerance : %f\n', dp);
	fprintf(file, 'Stopband Tolerance : %f\n', ds);
	fprintf(file,'Order : %d', order);
	fprintf(file,'\n\n');
	fprintf(file,'Transfer Function Coefficients (Decreasing Power)\n');
	fprintf(file,'---------------------------\n');
	fprintf(file,'Nemerator Coefficients\n');
	[num, den] = numden(vpa(h_analog));
    fact = coeffs(den);
    num = num / fact(end);
    den = den / fact(end);
	num_coeffs = sym2poly(vpa(num));
	den_coeffs = sym2poly(vpa(den));
	fprintf(file,strtrim(sprintf('%d ',num_coeffs)));
	fprintf(file,'\n\n');
	fprintf(file,'Denominator Coefficients\n');
	fprintf(file,strtrim(sprintf('%d ',den_coeffs)));
	
	disp('Bandpss Analog Traansfer Function')
	trans = poly2sym(num_coeffs,s)/poly2sym(den_coeffs,s);
	trans = vpa(trans,5)
	fclose(file);
	
	%% plot Analog transfer Function
	plot_s_transfer(h_analog, ws1/10 , ws2*10, 'Bandpass-Analog');
end