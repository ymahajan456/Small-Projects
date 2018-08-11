function ySampFarrowOut = Farrow_filter_float(sigIn, freqFract, coeffs)

A = coeffs;
[M,N] = size(A);

% generate the output indexes 
t = (1:(length(sigIn)*freqFract))-1;
t = t(:)/freqFract;

% generate the samples to start the FIR filter (for each output sample) 
x = round(t);

% generate the samples fraction for each output sample, and quantize it
r = x-t;

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
    y(:,k) = xin*A(:,k);
end

% build the coefficients for the combining
alpha = ones(size(r));
for i=1:(N-1)
    alpha = [alpha r.^i];   % [1 r r.^2 r.^3 r.^4 ....];
end

% combine the FIR outputs
ySampFarrowOut = sum(y.*alpha,2);


end