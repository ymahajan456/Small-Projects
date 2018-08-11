%% Analog Butterworth Lowpass Filter Design Function
function [hanalog, order, wc] = ButterWorth_Analog(wp, ws, dp, ds)
	% Check validity of the parameters
	if(wp >= ws)
		error('Passband cutoff must be smaller than Stopband cutoff');
	end
	
	if(~(dp > 0 && dp < 1 && ds > 0 && ds < 1))
		error('Passband and Stopband tolerance must belong to interval (0,1)');
	end
	
	% Claculate order of the filter
	d1 = 1/((1-dp)^2) - 1;
	d2 = 1/ds^2 -1;
	order = ceil(0.5 * log(d2/d1)/log(ws/wp));
	wc = ws * d2^(-1/(2*order));		% wc max to get min cut in passband
	
	% find the rrots of the filter and form the denominator polynomial by convolving root coefficients
	Sz = zeros(1,order);
	denom = [1];
	for n = 1:order 
		ks = wc*exp(1i *(2*n-1+order)*pi/(2*order));
		Sz(n) = ks; 
		denom = conv(denom, [1,-ks]);
	end
	
	% remove negligible imagiary part (Occured due to computation errors)
	for n = 1:order+1
		denom(n) = real(denom(n));
	end
	
	% form the transfer function using coefficients
	syms s
    hanalog = poly2sym([wc^order],s)/poly2sym(denom,s);
		
	%% Export Data to File %%
	file = fopen(strcat(pwd,'\Data\ButterWorth_Analog.txt'),'w');
	fprintf(file, 'Filter Specifications\n');
	fprintf(file,'---------------------------\n');
	fprintf(file, 'Passband Edge : %f\n', wp);
	fprintf(file, 'Stopband Edge : %f\n', ws);
	fprintf(file, 'Passband Tolerance : %f\n', dp);
	fprintf(file, 'Stopband Tolerance : %f\n', ds);
	fprintf(file, '\n\n');
	fprintf(file, 'Poles of Butterworth Filter:\n');
	fprintf(file,'---------------------------\n');
	for n = 1: order
		fprintf(file, '%2d | %4.4e  + %4.4ej\n', n, real(Sz(n)), imag(Sz(n)));
	end
	fprintf(file,'\n\n');
	fprintf(file,'Order : %d', order);
	fprintf(file,'\n\n');
	fprintf(file,'Transfer Function Coefficients (Decreasing Power)\n');
	fprintf(file,'---------------------------\n');
	fprintf(file,'Nemerator Coefficients\n');
	[num, den] = numden(vpa(hanalog));
	fact = coeffs(den);
    num = num / fact(end);
    den = den / fact(end);
	num_coeffs = sym2poly(vpa(num));
	den_coeffs = sym2poly(vpa(den));
	fprintf(file,strtrim(sprintf('%d ',num_coeffs)));
	fprintf(file,'\n\n');
	fprintf(file,'Denominator Coefficients\n');
	fprintf(file,strtrim(sprintf('%d ',den_coeffs)));
	fclose(file);
	
	%% plot poles 
	figure;
	hold on;
	for n = 1:order
		polar(angle(Sz(n)), abs(Sz(n)), 'r*');
		daspect([1 1 1]);
	end
	grid on;
	title('Poles of Butterworth Filter');
	saveas(gcf, strcat(pwd,'\Plots\Butterworth_Poles.svg'));
	
	disp('ButterWorth Analog Analog Traansfer Function')
	trans = poly2sym(num_coeffs,s)/poly2sym(den_coeffs,s);
	trans = vpa(trans,5)

	%% plot Analog transfer Function
	plot_s_transfer(hanalog,wp/10,  ws*10,'Butterwoth');
end 