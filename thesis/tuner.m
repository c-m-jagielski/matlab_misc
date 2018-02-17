% Chris Jagielski
% Spring 2012
clc;
clear all; close all;
%% Information
%
% Chris Jagielski
% Senior Thesis - TAMU Research Fellows Program
% B.S.E.E. Class of 2012
%
%% Create Audio Sample
% Create a sinusoidal audio sample & others that can be analyzed

Fs = 8192-1; %sampling frequency of 2^13 Hz
t = [0:1/Fs:1.0]; %time vector; note lasts 1 second
% noise = rand([1,Fs+1]); %random noise
% ssoid = sin(2*pi*880*t) + noise; %generate sinusoid & add noise
ssoid = sin(2*pi*88*t);
% v = awgn(ssoid,10); %Additive White Gaussian noise
v = ssoid;
% wavwrite(v, 'test99.wav'); %save sample pitch as audio file

%% Fundamental Frequency

[y Freq nbits] = wavread('test5_789_8192sample.wav'); %input sound file data

L = length(y);
Y = fft(y); %take FFT
Yf = abs(Y); %obtain real values only

x = linspace(0,Freq,L-1); %used for plotting

figure; plot(x,Yf(1:L-1)) % Plot single-sided amplitude spectrum
% title('Amplitude Spectrum of input sound file')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

figure; plot(t,y) % Plot ORIGINAL sound file (time domain)
xlabel('Time (seconds)')
ylabel('Amplitude')

value = max(Yf); %find peak in spectrum
fund_freq = find(Yf==value,1) -1; %finds only 1 value that matches

%% Tuner
% Purpose: to determine the audio pitch

pitch = ('Unknown'); %initialize pitch value

% AMERICAN STANDARD PITCHES (all in Hz)
% A = 220;
% A1 = 233; % A sharp
% B = 247;
% C = 262; % 'middle C'
% C1 = 277;
% D = 294;
% D1 = 311;
% E = 330;
% F = 349;
% F1 = 370;
% G = 392;
% G1 = 415;

f = round(fund_freq); %round to nearest integer

i=0; %index for iterations of the following loop
while ((f < 212) || (f > 425))
    if f <= 210 %lower octave
        f = 2*f;
        i = i+1;
    elseif (f > 430) 
        f = 0.5*f;
        i = i+1;
    end
end

f = round(f); %make sure it's an integer (again)

%Set the pitch based on the fundamental frequency
if ((212 <= f) && (f <= 226)) 
    pitch = ('A');
elseif ((227 <= f) && (f <= 240)) 
    pitch = ('A sharp');
elseif ((241 <= f) && (f <= 254)) 
    pitch = ('B');
elseif ((255 <= f) && (f <= 269)) 
    pitch = ('C');
elseif ((270 <= f) && (f <= 285)) 
    pitch = ('C sharp');
elseif ((286 <= f) && (f <= 302)) 
    pitch = ('D');
elseif ((303 <= f) && (f <= 320)) 
    pitch = ('D sharp');
elseif ((321 <= f) && (f <= 339)) 
    pitch = ('E');
elseif ((340 <= f) && (f <= 359))
    pitch = ('F');
elseif ((360 <= f) && (f <= 381))
    pitch = ('F sharp');
elseif ((382 <= f) && (f <= 403)) 
    pitch = ('G');
elseif ((404 <= f) && (f <= 425))
    pitch = ('G sharp');
end
