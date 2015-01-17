function [resampled_signal] = linear_rsp (original_signal, sample_rate, sample_value)
%Funktion linear interpolation
%
%This function interpolates the new sample values of the input signal by connection the
%diskrete values with a straight line.
%The methode used is called linear interpolation.
%
%Syntax:    [resampled_signal] = linear_rsp (original_signal, sample_rate, sample_value)
%           linear_rsp (original_signal, sample_rate, sample_value)
%
%Input:     Input Signal
%           Sample rate of the input signal
%           Sample values to be interpolated
%
%Output:    Resampled signal

dt = 1 / sample_rate;
N = length(original_signal);  

resampled_signal = sample_value;
for i = 1 : length(sample_value)
        h1 = sample_value(i)/dt;
        h_int = h1 - mod(h1,1)+1;
        if h_int < length(original_signal)-1
            line = mod(h1,1) * (original_signal(h_int + 1) - original_signal(h_int)) + original_signal(h_int);
            resampled_signal(i)=line;
        else
             % resampled_signal(i)= original_signal(length(original_signal));
             resampled_signal(i)= 0;
    end
end
 resampled_signal =  resampled_signal';