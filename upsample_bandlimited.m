function [upsampled_signal] = bandlimited (original_signal, sampling_rate, X)
%Funktion Bandlimited Interpolation.
%
%The Bandlimited Interpolation approaches the ideal Interpolation (Shannon
%Therem) with an ideal Lowpass. The ideal low pass is unrealisable, due to
%the infinite long sinc function in the time domain. The chosen
%approximation is to cut off the sinc-funktion at the 5th zero crossing.
%
%Syntax:    [resampled_signal] = bandlimited (original_signal, sample_rate, sample_value, X)
%           bandlimited (original_signal, sample_rate, sample_value, X)
%
%Input:     Original Signal
%           Sample Rate of the Original Signal
%           The Upsampling Faktor X
%
%Output     Resampled Signal


dt = 1 / sampling_rate;         % calculate sampling interval
N = length(original_signal);       % calculate number of points
time_input = (0:dt:(N-1)*dt);   % time = all points between 0 until the end of the Signal

t=0:dt/X:(N-1)*dt;
h = 0;
for n = 1:N
    cutoff = 20/sampling_rate ;
    h = h + original_signal(n) * sinc(sampling_rate*(t - time_input(n))).*rectpuls(t-time_input(n), 2*cutoff);
end

upsampled_signal = h;


    
