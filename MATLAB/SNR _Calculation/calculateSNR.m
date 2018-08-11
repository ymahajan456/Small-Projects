%% Calculatr SNR of sngle tone signal %%

function [SNR, aSNR] = calculateSNR(signal, samp, fTone, range)
	if (nargin < 3)
		error('Incorrect number of signal parameters');
	end

	if(nargin < 4)
		range = [10, samp/2];
	end
	inputLen = length(signal);
	signal = signal(:);
	fftSignal = fft(signal);
	validFrange = ceil((inputLen + 1)/2);
	startN = floor(range(1)*inputLen/samp) + 1;
	endN = ceil(range(2)*(inputLen)/samp) + 1;
	freqVector = (startN - 1: endN -1)*samp/inputLen;

	% A -Weighting filter
	c2 = 20.598997^2;
	c3 = 107.65265^2;
	c4 = 737.86223^2;
	c5 = 12194.217^2;

	fSqr = freqVector.^2;
	num = c5 * fSqr.^2;
	den = sqrt(((c2+fSqr).^2) .* (c3+fSqr) .* (c4+fSqr) .* ((c5+fSqr).^2));
	Afilt = num./den;
	Afilt = Afilt(:);

	PSDvector = abs(fftSignal(startN : endN )).^2;
	PSDfilt = abs(Afilt).^2;
	notchVector = ones(length(PSDfilt),1);

	nToneEnd = ceil(fTone*1.05*inputLen/samp) + 1;
	nToneStart = floor(fTone*0.95*inputLen/samp) + 1;
  
  if(nToneEnd > length(freqVector))
    nToneEnd = length(freqVector);
  end  

	% disp(freqVector(1));
	% disp(freqVector(length(freqVector)));
	% disp(freqVector(nToneStart));
	% disp(freqVector(nToneEnd));

	notchVector(nToneStart: nToneEnd) = zeros(nToneEnd - nToneStart + 1, 1);

	noisePSD = PSDvector.*notchVector;
	signalPSD = PSDvector.*(1-notchVector);

	aNoisePSD = noisePSD.* PSDfilt;
	aSignalPsd = signalPSD .* PSDfilt;

	noisePower = noisePSD' * noisePSD;
	signalPower = signalPSD' * signalPSD;
	aNoisePower = aNoisePSD' * aNoisePSD;
	aSignalPower = aSignalPsd' * aSignalPsd;

	SNR = 10*log10(signalPower/noisePower);
	aSNR = 10*log10(aSignalPower/aNoisePower);


	figure;
	plot(freqVector, 20*log10(noisePSD));
	hold on;
	plot(freqVector, 20*log10(signalPSD),'-r');

end
