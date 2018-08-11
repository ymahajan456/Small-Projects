function h_fir = Bandstop_FIR(wp1, ws1, ws2, wp2, dp, ds, samp)
	% check validity of the parameters
	if(ws2 > samp/2)
		error('There is aliasing');
	end
	
		if(~(wp1 < ws1 && ws1 < ws2 && ws2 < wp2))
		error('Must satisfy Ws1 < Wp1 < Wp2 < Ws2 to get valid filter');
	end
	
	% Calculate normalized frequencies
	wnp1 = 2*pi*wp1/samp;
	wnp2 = 2*pi*wp2/samp;
	wns1 = 2*pi*ws1/samp;
	wns2 = 2*pi*ws2/samp;
	
	% Determine transitio region specifications
	% taking more stringent condition
	d = min(dp, ds);
	dw = min((wns1-wnp1),(wnp2-wns2));
	wc1 = (wnp1+wns1)/2;
	wc2 = (wns2+wnp2)/2;
	
	% Calculating order of the filter
	A = -20 * log10(d);
	M = 1 + ceil((A-8)/(2.285*dw));
	if(mod(M,2) == 0)		% filter length must be odd
		M = M+1;
	end
	
	% increasing order of the filter to fit into specifications
	M = M + 2 ;
	
	N = (M-1)/2;
	
	n = -N : 1 : N;
	
	% calculating ideal impulse fresponse of the filter
	h_ideal = (sin(wc1 * n) - sin(wc2 * n))./(pi * n);
	h_ideal(N + 1) = 1 - (wc2-wc1)/pi;
	
	% Determine Kaiser window parameters
	beta = 0;
	if(A >= 21 && A <= 50)
		beta = 0.5842 * (A - 21)^(0.4) + 0.07886 * (A - 21);
	elseif(A > 50)
		beta = 0.1102 * (A - 8.7);
	end
	
	% get the kaiser window and multiply with the ideal impulse response
	W = kaiser(M, beta);
	syms z
	
	% form the transfer function
	h_fir = poly2sym(h_ideal .* W' ,z);
	
	% plot the frequency response
	plot_z_transfer(h_fir, samp, M-1, 'Bandstop-FIR');
end