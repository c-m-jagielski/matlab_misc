clear all; clc;
[y Freq nbits] = wavread('test1_222.wav'); %input sound file data
SIZ = wavread('test1_222.wav','size');
y1 = abs(fft(y)); %obtain real values only of FFT of sound

value = max(y1); %peak in frequency domain
a = find(y1==value,1,'first')-1; %finds only 1 value that matches
fund_freq = a(1,1);
