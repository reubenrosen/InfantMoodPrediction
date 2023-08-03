clc
clear all
close all
[y, Fs]=audioread('test50.wav');
info = audioinfo('test50.wav');


fft
figure(1)
data_fft = fft(y(:,1));
plot(abs(data_fft(:,1)))
f = (0:length(data_fft)-1)*(Fs/2)/length(data_fft);
n = length(y);                         
fshift = (-n/2:n/2-1)*(Fs/n);
yshift = fftshift(data_fft);
plot(fshift,abs(yshift))






plot of original signal
figure(2)
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
plot(t,y)
xlabel('Time')
ylabel('Audio Signal')
title('Original Signal')


Filtering
n=7;
beginFreq=70/(Fs/2);
endFreq=20000/(Fs/2);
[b,a]=butter(n, [beginFreq, endFreq], 'bandpass');
fOut=filter(b,a,y);
p = audioplayer(fOut, Fs);
p.play;
yout = bandpass(y(:,1),[142.9107 6620.128],Fs);
outfft=fft(yout);
figure(3)
plot(t,yout)
title('Filter');

mfcc
coeffs=mfcc(yout,Fs)
centroid = spectralCentroid(yout,Fs);
kurtosis = spectralKurtosis(yout,Fs);
energy=sum(abs(outfft).^2)/numel(Fs);
skewness = spectralSkewness(yout,Fs);
rolloffPoint = spectralRolloffPoint(yout,Fs);
flatness = spectralFlatness(yout,Fs);
spread = spectralSpread(yout,Fs);




mfvalue=new_mf(yout);
spflat=spectral_flatness(yout);
fspecentroid=Featurespectralcentroid(yout,Fs)



