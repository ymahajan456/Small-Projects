function ySampFarrowOut = Farrow_filter_fixed(sigIn, freqFract, coeffs, config)

% CONFIG THE FIXED POINT PARAMETERS:
% config.Rbits % number of bits of the frequency fraction
% config.Fbits % number of bits at the FIR output
% config.Mbits % number of bits at the output of the multiply by the fraction
% config.Obits % number of bits at the output

A = coeffs;
[M,N] = size(A);

% generate the output indexes 
t = (1:(length(sigIn)*freqFract))-1;
t = t(:)/freqFract;

% generate the samples to start the FIR filter (for each output sample) 
x = floor(t+0.5);

% generate the samples fraction for each output sample, and quantize it
r = x-t;
r = floor(r*(2^(config.Rbits-1))+0.5);
r = r/(2^(config.Rbits-1));

% generate the indexes for the FIR input [x x+1 x+2 x+3 x+4 x+5 x+6 x+7]
rr = x;  
for i=1:(M-1)
    rr = [rr x+i];
end

% do min/max for the indexes to avoid index overflow
rr = min(max(rr,1),length(sigIn));

% select the data for the FIR (for each output sample)
xin = sigIn(rr);

% perform the FIR's on the data 
for k=1:N
    v = xin*A(:,k);
    % round the output of the FIR output
    v = floor(v*(2^(config.Fbits-1))+0.5);
    y(:,k) = v/(2^(config.Fbits-1));
end

% combine the FIR outputs
v = y(:,N);
for i=(N-1):-1:1
    % multiply the combined value with the fraction
    v = v.*r;
    % round to Mbits
    v = floor(v*(2^(config.Mbits-1))+0.5);
    v = v/(2^(config.Mbits-1));
    % add the next FIR output 
    v = v + y(:,i);
end

% round the output
v = floor(v*(2^(config.Obits-1))+0.5);
v = v/(2^(config.Obits-1));
ySampFarrowOut = v;


end