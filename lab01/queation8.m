%
%   HW1 Preview
%	sample codes (Matlab script - Example of FT implementation)
%					(Not precise in mathematics)
%
%
%                                   Edited by Meng-Lin Li, 03/03/2016
%									Revised by Meng-Lin Li, 03/02/2017
%									Revised by Meng-Lin Li, 03/08/2018
%


% ---------- Generate sampled cosine/discrete-time sinusoid ----------
F0 = 5; % in MHz
Fs = 100; % sampling rate/sampling frequency, in MHz or Msamples/sec
T = 1/Fs;  % sampling interval in time
total_time = 1; % in us

t_axis = (5:T:total_time+5);  % time axis

% !!! Sampling in time 
iF0Ratio = 1;
F0 = F0*iF0Ratio;
x = cos(2*pi*F0*t_axis);  % sampled cosine/discrete time sinusoid ,time domain
Npoint = length(x);   % number of points in sampled cosine
iZeroPaddingRatio = 1;
x = [ x zeros(1,Npoint*(iZeroPaddingRatio-1))]; % x with zero padding

Npoint = length(x);
t_axis = (0:(Npoint-1))*T; % update the time axis

figure
stem(t_axis, x,'r','linewidth',2);
xlabel('Time (\mus)');
ylabel('x(nT)');
title('Discrete time sinusoid (time domain)');

figure
stem(0:1:Npoint-1, x,'b', 'linewidth', 2);
xlabel('Time (n)')
ylabel('x[n]');
title('Discrete time sinusoid (time domain)')


% ---------- Fourier transform - Analysis ----------

% !!! Sampling in frequency
iFNpointRatio = 1;
Npoint1 = Npoint*iFNpointRatio; % number of sampling points in frequency domain
dF = Fs/Npoint1; % sampling interval in frequency

% !!! Observed frequency range, Check working frequency range (i.e., fundamental frequency range) for this CTFT codes
iFRangeRatio = 1;
Npoint2 = Npoint1*iFRangeRatio;
F_axis = ((1:1:Npoint2)-(Npoint2+1)/2)*dF;
X = zeros(1,length(F_axis));
Y = zeros(1,length(F_axis));

% implementatoin of X(f) = summation x(ti)*exp(-j*2*pi*f*ti)*dt 
%(Not very precise in mathematics)
% !!! Vectorization, can be found at the provided Matlab_FTandPlot_VectorizedNoLoop_demo.m
for iFreq = 1:length(F_axis),
    iFreq
   for iTime = 1:length(t_axis),
       X(iFreq) = X(iFreq) + x(iTime)*exp(-sqrt(-1)*2*pi*F_axis(iFreq)*t_axis(iTime))*T; % what if t_axis is not starting from time = 0?
       Y(iFreq) = X(iFreq) * exp(-sqrt(-1)*2*pi*F_axis(iFreq)*5);
   end
end

mag_X = abs(Y);   % magnitude
pha_X = angle(Y); % phase

figure
plot(F_axis, mag_X,'linewidth',2);
xlabel('Frequency (MHz)');
ylabel('abs(X(F))')
title('Magnitude spectrum ')

figure
plot(F_axis, pha_X,'linewidth',2);
xlabel('Frequency (MHz)');
ylabel('phase(X(F))')
title('Phase spectrum ')


% --------------------
load ECG % ECG: ECG signal, Fs: sampling rate in Hz







