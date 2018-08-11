function Fh = farrow_design(K,M,NP,Fs,Fpass,Fstop,Wpass,Wstop,disp)
%
% This function builds the Farrow filter coefficients based on filter
% parameters and design parameters.
% Note that the FIR filters are symetric and antysymetric, therefore only
% 1/2 of the mutipliers are required.
%

% CONFIGURATION EXAMPLE
% Fs    = 10;       % sampling frequency (input)
% K     = 64;         % filter interpolation
% M     = 8;          % filter length (symbols)
% NP    = 4;          % order-1
% Fpass = 3;        % Passband Frequency
% Fstop = Fs-Fpass;   % Stopband Frequency
% Wpass = 1;       % Passband Weight
% Wstop = 1;        % Stopband Weight


% compute parameters
FsK    = Fs*K;    % Interpolated Sampling Frequency
N      = M*K-1;   % Filter Order

% Calculate the coefficients using the FIRLS function.
b  = firls(N, [0 Fpass Fstop FsK/2]/(FsK/2), [1 1 0 0], [Wpass Wstop]);
Hd = dfilt.dffir(b);
h = (Hd.Numerator')*K;  % get the filter coefficients

% plot the filter as it was designed
if disp
    figure(1)
    freqz(h,1,8192,FsK)
    figure(2)
    plot(h)
end

% reshape the filter - Farrow design method
hKM = reshape(h,K,M);

% plot the filter sections
if disp
    figure(3)
    plot(hKM)
end

% build the distance vector
t = (1:K)/K;
t = t-mean(t);
t = t(:);

% finf the polynomial decomposition of each section
fh = [];
for i=1:M
    h0 = hKM(:,i);
    p = polyfit(t,h0,NP);
    fh = [fh p(:)];
end

% build the filter coefficients from the polynoms
est = [];
for i=1:M
    v = polyval(fh(:,i),t);
    est = [est; v];
end

% plot the original and estimated filters, plot the difference and plot the
% bode of the new filter
if disp
    figure(4)
    plot([h est])
    figure(5)
    plot(h-est)
    figure(6)
    freqz(est/K,1,8192,FsK)
end

% reorganize the coefficients
Fh = fh';
Fh = Fh(:,end:-1:1)

end