function [SNR, aSNR] = calculateAvgSNR(fileName, fTone, range)
	[signal, samp] = audioread(fileName);
  if (nargin < 3)
      range = [10, samp/2];
  end  
	signalLen = length(signal) - 100;
	FFTlen = samp/fTone;
	numSegments = floor(signalLen/FFTlen);
	m = 1;
	while(numSegments > 20)
		FFTlen = m * FFTlen;
		m++;
		numSegments = floor(signalLen/FFTlen);
	end

	sumSNR = 0.0;
	sumASNR = 0.0;
	startN = 100;
	for i = 1:numSegments
		[SNR, aSNR] = calculateSNR(signal(startN: startN + FFTlen -1), samp, fTone, range);
		sumSNR += SNR;
		sumASNR += aSNR;
	end
	SNR = sumSNR / numSegments;
	aSNR = sumASNR / numSegments;
end


