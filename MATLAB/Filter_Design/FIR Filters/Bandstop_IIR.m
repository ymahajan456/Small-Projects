function [h_digital, order] = Bandstop_IIR(wp1, ws1, ws2, wp2, dp, ds, samp, type)
	% check validity of the parameters
	if ~exist('type','var')
	type = 'Monotonic';
	end
	if(ws2 > samp/2)
		error('There is aliasing');
    end
	
	% Calculate bandpass transformation frequencies
	wp1_analog = tan(pi*wp1/samp);
	ws1_analog = tan(pi*ws1/samp);
	wp2_analog = tan(pi*wp2/samp);
	ws2_analog = tan(pi*ws2/samp);
	
	% get analog transfer function
	[h_analog, order] = Bandstop_Analog(wp1_analog, ws1_analog, ws2_analog, wp2_analog, dp, ds, type);
	%plot_s_transfer(h_analog,ws1_analog, ws2_analog);
	syms s z
	%figure; 
	
	% get transfer function using bilinear transform
	h_digital = subs(h_analog,s, (1-z)/(1+z));
	% plot the frequency response
	plot_z_transfer(h_digital, samp, order, 'Bandstop-IIR');
end