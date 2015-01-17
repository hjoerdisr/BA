function [resampled_signal] = ZoH (original_signal, sample_rate, sample_value)
%Funktion Zero-order Hold
%
%This function interpolates the new sample values of the input signal by holding the last input value.
%The methode used is called Zero-order Hold.
%
%Syntax:    [resampled_Signal] = ZoH (LTI_Signal, Samle_time)
%           ZoH (LTI_Signal, Samle_time)
%
%Input:     Input Signal
%           sample rate of the input signal
%           new sample_points (in time)
%
%Output:    Resampled signal

dt = 1/sample_rate;
N = length(original_signal);  

resampled_signal=sample_value;
for i = 1 : length(sample_value)
    h1 = sample_value(i) / dt;
    if h1 < length(original_signal)
        resampled_signal(i) = original_signal(h1 - mod(h1,1)+1);
        %resampled_signal(i) = original_signal(sample_value(i) - mod(sample_value(i),1) + 1);
    else
        % resampled_signal (i) = original_signal(length(original_signal));
        resampled_signal (i) = 0;
    end
end

resampled_signal=resampled_signal';
   
    

