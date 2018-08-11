function [h_analog, order] = Bandstop_Analog(wp1, ws1, ws2, wp2, dp, ds, type)
	% check validity of the parameters
	if(nargin < 7)
		type = 'Monotonic';
	end
	
	if(~(strcmp(type,'Monotonic') || strcmp(type,'Equiripple')))
		error('Incorrect Filter Type Arguiment');
	end
	if(~(wp1 < ws1 && ws1 < ws2 && ws2 < wp2))
		error('Must satisfy Wp1 < Ws1 < Ws2 < Wp2 to get valid filter');
	end
	% other errors are detected by ButterWorth_Analog function 

	% determine parameters for frequency transformation (bandstop - lowpass)
	b = wp2 - wp1;
	w0_sqr = wp1*wp2;
	% check if ws1 < w0 < ws2
	% if not recalculate the parameters
	if((w0_sqr < ws1^2) || (w0_sqr > ws2^2 ))
		w0_sqr = ws1*ws2;
		b = ws2 - ws1;
	end
	
	% calculate lowpass filter specifications
	wlp1 = b * wp1 / (w0_sqr - wp1^2);
	wls1 = b * ws1 / (w0_sqr - ws1^2);
	wls2 = b * ws2 / (w0_sqr - ws2^2);
	wlp2 = b * wp2 / (w0_sqr - wp2^2);
	wlp = max(abs(wlp1), abs(wlp2));
	wls = min(abs(wls1),abs(wls2));
	
	syms s
	
	% get lowpass frequency response
	if strcmp(type,'Monotonic')
		[hl_analog, lorder, wc] = ButterWorth_Analog(wlp, wls, dp, ds);
	else
		[hl_analog, lorder, eps] = Chebyshev_Analog(wlp, wls, dp, ds);
	end
	
	% using frequency transformation to get bandpass transfer function
	h_analog = subs(hl_analog, s, (b*s)/(s^2 + w0_sqr));
	order = lorder*2;
	
	%% Export Data to File %%
	file = fopen(strcat(pwd,'\Data\Bandstop_Analog.txt'),'w');
	fprintf(file, 'Filter Specifications\n');
	fprintf(file,'---------------------------\n');
	fprintf(file, 'Upper Passband Edge : %f\n', wp2);
	fprintf(file, 'Upper Stopband Edge : %f\n', ws2);
	fprintf(file, 'Lower Passband Edge : %f\n', wp1);
	fprintf(file, 'Lower Stopband Edge : %f\n', ws1);
	fprintf(file, 'Passband Tolerance : %f\n', dp);
	fprintf(file, 'Stopband Tolerance : %f\n', ds);
	fprintf(file, '\n\n');
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
	
	disp('Bandstop Analog Traansfer Function')
	trans = poly2sym(num_coeffs,s)/poly2sym(den_coeffs,s);
	trans = vpa(trans,5)
	
	fclose(file);
	
	%% plot Analog transfer Function
	plot_s_transfer(h_analog, wp1 , wp2, 'Bandstop_Analog');
end