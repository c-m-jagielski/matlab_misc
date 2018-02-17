% debug
%%final project Ecen 444
close all; clear all;
load Table_Notes_Frequency.mat

[X,FS,NBITS]=wavread('Piano.wav');
%wavplay(X,FS)

plot(X(1:length(X),1))

%The given Piano piece has 12 notes! I use windows to separate into twelve
%different notes
table2=table(1:88,2);
s=cell2mat(table2);
x=X(0.5e5:0.8e5,1);
w1=window(@rectwin,length(x));
x1=x.*w1; %note 1

x=X(0.8e5:1.02e5,1);
w2=window(@rectwin,length(x));
x2=x.*w2;%note2
x=X(1.02e5:1.4e5,1);
w3=window(@rectwin,length(x));
x3=x.*w3; %note3
x=X(1.4e5:1.668e5,1);
w4=window(@rectwin,length(x));
x4=x.*w4;%note4
x=X(1.668e5:1.885e5,1);
w5=window(@rectwin,length(x));
x5=x.*w5;%note5
x=X(1.885e5:2.31e5,1);
w6=window(@rectwin,length(x));
x6=x.*w6;%note6
x=X(2.31e5:2.53e5,1);
w7=window(@rectwin,length(x));
x7=x.*w7;%note7
x=X(2.53e5:2.734e5,1);
w8=window(@rectwin,length(x));
x8=x.*w8;%note8
x=X(2.734e5:2.958e5,1);
w9=window(@rectwin,length(x));
x9=x.*w9;%note9
x=X(2.958e5:3.155e5,1);
w10=window(@rectwin,length(x));
x10=x.*w10;%note10
x=X(3.155e5:3.58e5,1);
w11=window(@rectwin,length(x));
x11=x.*w11;%note11
x=X(3.58e5:4.245e5,1);
w12=window(@rectwin,length(x));
x12=x.*w12;%note12

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FFT of each of the twelve signals gives use the distinct frequency of the
%note

N1 = length(x1);
k1 = transpose(-N1/2:N1/2-1);
w1 = k1*2*pi/N1;
f1 = w1*FS;
NFFT = 2^nextpow2(N1); % Next power of 2 from length of y
% Y1=fftshift(fft(x1,NFFT));
Y1=fft(x1,NFFT);
% Y1=fft(x1,NFFT);
index=0.5*FS*linspace(0,1,NFFT/2 + 1);
figure
% plot(index,abs(Y1))
plot(index,2*abs(Y1(1:NFFT/2+1)))
title('Note1')
xlabel('Frequency index')
fo=1650; %from graph
% fo=333;

 %Comparing this frequency with the given table to get the correct index
i1=find(s<fo+20&s>fo-20);

% keyboard

N2 = length(x2);
k2 = transpose(-N2/2:N2/2-1);
% Y2=fftshift(fft(x2));
w2 = k2*2*pi/N2;
f2 = w2*FS;
NFFT = 2^nextpow2(N2); % Next power of 2 from length of y
Y2=fft(x2,NFFT);
index=0.5*FS*linspace(0,1,NFFT/2 + 1);
figure
% plot(f2,abs(Y2))
plot(index,2*abs(Y2(1:NFFT/2+1)))
title('Note2')
ylabel('Frequency')
fo=1839; %from graph

 %Comparing this frequency with the given table to get the correct index
i2=find(s<fo+40&s>fo-40);
% keyboard

N3 = length(x3);
k3 = transpose(-N3/2:N3/2-1);
Y3=fftshift(fft(x3));
w3 = k3*2*pi/N3;
f3 = w3*FS;
figure
plot(f3,abs(Y3))
title('Note3')
ylabel('Frequency')
fo=2057; %from graph

 %Comparing this frequency with the given table to get the correct index
i3=find(s<fo+40&s>fo-40);

line1=[table(i1,1),table(i2,1),table(i3,1)];

display('song')
% song=[line1; line2; line3; line4]
song=[line1]
% C D E C D E D C D E C C
% C 261.6256
% D 293.6648
% E 329.6276
%     'G#6'    'A#6'    ' C7'  =  1661.2 1864.7 2093.0
%     'G#6'    'A#6'    ' C7'
%     'A#6'    'G#6'    'A#6'
%     ' C7'    'G#6'    'G#6'

%     ' A0'    [    27.5000]
%     'A#0'    [    29.1352]
%     ' B0'    [    30.8677]
%     ' C1'    [    32.7032]
%     'C#1'    [    34.6478]
%     ' D1'    [    36.7081]
%     'D#1'    [    38.8909]
%     ' E1'    [    41.2034]
%     ' F1'    [    43.6535]
%     'F#1'    [    46.2493]
%     ' G1'    [    48.9994]
%     'G#1'    [    51.9131]
%     ' A1'    [    55.0000]
%     'A#1'    [    58.2705]
%     ' B1'    [    61.7354]
%     ' C2'    [    65.4064]
%     'C#2'    [    69.2957]
%     ' D2'    [    73.4162]
%     'D#2'    [    77.7817]
%     ' E2'    [    82.4069]
%     ' F2'    [    87.3071]
%     'F#2'    [    92.4986]
%     ' G2'    [    97.9989]
%     'G#2'    [   103.8262]
%     ' A2'    [   110.0000]
%     'A#2'    [   116.5409]
%     ' B2'    [   123.4708]
%     ' C3'    [   130.8128]
%     'C#3'    [   138.5913]
%     ' D3'    [   146.8324]
%     'D#3'    [   155.5635]
%     ' E3'    [   164.8138]
%     ' F3'    [   174.6141]
%     'F#3'    [   184.9972]
%     ' G3'    [   195.9977]
%     'G#3'    [   207.6523]
%     ' A3'    [   220.0000]
%     'A#3'    [   233.0819]
%     ' B3'    [   246.9417]
%     ' C4'    [   261.6256]
%     'C#4'    [   277.1826]
%     ' D4'    [   293.6648]
%     'D#4'    [   311.1270]
%     ' E4'    [   329.6276]
%     ' F4'    [   349.2282]
%     'F#4'    [   369.9944]
%     ' G4'    [   391.9954]
%     'G#4'    [   415.3047]
%     ' A4'    [   440.0000]
%     'A#4'    [   466.1638]
%     ' B4'    [   493.8833]
%     ' C5'    [   523.2511]
%     'C#5'    [   554.3653]
%     ' D5'    [   587.3295]
%     'D#5'    [   622.2540]
%     ' E5'    [   659.2551]
%     ' F5'    [   698.4565]
%     'F#5'    [   739.9888]
%     ' G5'    [   783.9909]
%     'G#5'    [   830.6094]
%     ' A5'    [   880.0000]
%     'A#5'    [   932.3275]
%     ' B5'    [   987.7666]
%     ' C6'    [1.0465e+003]
%     'C#6'    [1.1087e+003]
%     ' D6'    [1.1747e+003]
%     'D#6'    [1.2445e+003]
%     ' E6'    [1.3185e+003]
%     ' F6'    [1.3969e+003]
%     'F#6'    [1.4800e+003]
%     ' G6'    [1.5680e+003]
%     'G#6'    [1.6612e+003]
%     ' A6'    [1.7600e+003]
%     'A#6'    [1.8647e+003]
%     ' B6'    [1.9755e+003]
%     ' C7'    [2.0930e+003]
%     'C#7'    [2.2175e+003]
%     ' D7'    [2.3493e+003]
%     'D#7'    [2.4890e+003]
%     ' E7'    [2.6370e+003]
%     ' F7'    [2.7938e+003]
%     'F#7'    [2.9600e+003]
%     ' G7'    [3.1360e+003]
%     'G#7'    [3.3224e+003]
%     ' A7'    [3.5200e+003]
%     'A#7'    [3.7293e+003]
%     ' B7'    [3.9511e+003]
%     ' C8'    [4.1860e+003]