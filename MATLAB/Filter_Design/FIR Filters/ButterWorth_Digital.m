function [h_digital, hanalog, order, wc] = ButterWorth_Digital(wp, ws, dp, ds, samp)
	if(ws > samp/2)
		error('There is aliasing');
	end
	
	% other error are detected by ButterWorth_Analog function
	
	wp_analog = tan(pi*wp/samp);
	ws_analog = tan(pi*ws/samp);
	
	[hanalog, order, wc] = ButterWorth_Analog(wp_analog, ws_analog, dp, ds);
	syms s z
	h_digital = subs(hanalog,s, (1-z)/(1+z));
	
	plot_z_transfer(h_digital, samp, order, 'ButterWorth-Digital');
end