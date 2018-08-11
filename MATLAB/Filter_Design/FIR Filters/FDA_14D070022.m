% Filter Design Assignmet 
% EE 338 Digital Signal Processing
% Name Yogesh Mahajan
% Rol. No: 14D070022
%------------------------------------------------------------------------------------------

mkdir('Data');
mkdir('Plots');

%% Q1 EQUIRIPPLE IIR BANDPASS FILTER SPECIFICATIONS
%  PassBand Lower Frequency: 22.7kHz
%  PassBand Upper Frequency: 27.7kHz
[h_bp_iir, order_bp_iir] = Bandpass_IIR(21.7e3,22.7e3,27.7e3,28.7e3,0.1,0.1,140e3,'Equiripple');

%% Q2  MONOTONIC IIR BANDSTOP FILTER SPECIFICATIONS 
%  StopBand Lower Frequency: 17.6kHz
%  StopBand Upper Frequency: 20.6kHz

[h_bs_iir, order_bs_iir] = Bandstop_IIR(16.6e3,17.6e3,20.6e3,21.6e3,0.1,0.1,90e3);

%% Q1 EQUIRIPPLE FIR BANDPASS FILTER SPECIFICATIONS
%  PassBand Lower Frequency: 22.7kHz
%  PassBand Upper Frequency: 27.7kHz

h_bp_fir = Bandpass_FIR(21.7e3,22.7e3,27.7e3,28.7e3,0.1,0.1,140e3);

%% Q2  MONOTONIC FIR BANDSTOP FILTER SPECIFICATIONS 
%  StopBand Lower Frequency: 17.6kHz
%  StopBand Upper Frequency: 20.6kHz

h_bs_fir = Bandstop_FIR(16.6e3,17.6e3,20.6e3,21.6e3,0.1,0.1,90e3);

% close all plots
close all;

