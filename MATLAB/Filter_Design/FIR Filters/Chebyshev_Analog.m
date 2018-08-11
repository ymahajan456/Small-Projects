function [h_analog, order, eps] = Chebyshev_Analog(wp, ws, dp, ds)
	% check validity  of the arameters
	if(wp >= ws)
		error('Passband cutoff must be smaller than Stopband cutoff');
	end
	
	if(~(dp > 0 && dp < 1 && ds > 0 && ds < 1))
		error('Passband and Stopband tolerance must belong to interval (0,1)');
	end
	
	% calculate order of the filter
	d1 = 1/((1-dp)^2) - 1;
	d2 = 1/ds^2 -1;
	
	order = ceil(acosh(sqrt(d2/d1))/acosh(ws/wp));
	eps = sqrt(d2/ (cosh(order * acosh(ws/wp))^2));
	
	% find the roots of the chebyshev filter using the fact that roots are on elipse
	% get denominator coefficients
	Sz = zeros(1, order);
	denom = [1];
	r1 = -wp*sinh((1/order) * asinh(1/eps));
	r2 = wp * 1i * cosh((1/order) * asinh(1/eps));
	for n = 1: order
		theta = pi/2 * (2*n-1)/order;
		ks = r1 * sin(theta) + r2 * cos(theta);
		Sz(n) = ks;
		denom = conv(denom, [1, -ks]);
	end
	
	% remove negligible imaginary parts (Occured due to computation errors)
	for n = 1:order+1
		denom(n) = real(denom(n));
	end
	% form the tr function using coefficients
	syms s
	h_analog = poly2sym([wp^order/(2^(order-1)*eps)],s)/poly2sym(denom,s);
	
	%% Export Data to File 
    disp(pwd)
    strcat(pwd,'\Data\Chebyshev_Analog.txt')
	file = fopen(strcat(pwd,'\Data\Chebyshev_Analog.txt'),'w');
	fprintf(file, 'Filter Specifications\n');
	fprintf(file,'---------------------------\n');
	fprintf(file, 'Passband Edge : %f\n', wp);
	fprintf(file, 'Stopband Edge : %f\n', ws);
	fprintf(file, 'Passband Tolerance : %f\n', dp);
	fprintf(file, 'Stopband Tolerance : %f\n', ds);
	fprintf(file, '\n\n');
	fprintf(file, 'Poles of Chebyshev Filter:\n');
	fprintf(file,'---------------------------\n');
	for n = 1: order
		fprintf(file, '%2d | %4.4e  + %4.4ej\n', n, real(Sz(n)), imag(Sz(n)));
	end
	fprintf(file,'\n\n');
	fprintf(file,'Order : %d', order);
	fprintf(file,'\n\n');
	fprintf(file,'Transfer Function Coefficients (Decresing Powers)\n');
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
	fclose(file);
	
	%% plot poles 
	figure;
	hold on;
	for n = 1:order
		polar(angle(Sz(n)), abs(Sz(n)), 'r*');
		daspect([1 1 1]);
	end
	grid on;
	title('Poles of Chebyshev Filter');
	saveas(gcf, strcat(pwd,'\Plots\Chebyshev_Poles.svg'));
	
	disp('Chebyshev Analog Traansfer Function')
	trans = poly2sym(num_coeffs,s)/poly2sym(den_coeffs,s);
	trans = vpa(trans,5)
	
	%% plot Analog transfer Function
	plot_s_transfer(h_analog, wp/10, ws*10,'Chebyshev');
end
