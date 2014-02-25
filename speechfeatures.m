function [ V ] = speechfeatures( data, fs )
%This function generates the mel cepstrum coefficients for the given speech
%data in the format that can be input to the neural network
%   Frame length = 256 samples
%   Frame shift  = 64 samples
%   Window = Hamming
%   12 cepstral coefficients
%   24 filter banks
%   192 frame overlap

signal1 = vadsohn(data, fs, 'a');% vadsohn implements a data activity detector
ind = find(signal1);%find index of nonzero elements
cut_signal = data(ind);
signal = cut_signal;
signal_normalized = mapminmax(signal);%Normalization
EmphasisSignal = filter( [ 1 -0.9375] ,1,signal); % hp filtering
Frames=enframe(EmphasisSignal,hamming(256),64);% Windowing
Amplitude = sum(abs(Frames),2);
Energy = sum((Frames.*Frames),2);
temp1 = enframe(signal(1:end-1),256,64);
temp2 = enframe(signal(2:end),256,64);
signs = (temp1.*temp2)<0;
diffs = (temp1-temp2)>0.02;
Zcr = sum(signs.*diffs,2);%used to detect the vowel and consonant
%
%
%Feature Extraction
mfccs = melcepst(EmphasisSignal,fs,'M',12,24,256,192);%The inputs to the function are in the order - signal,sampling frequency, window used(hamming in this case), no of cepstral coefficients, number of filters in filter bank, length of frame in samples, frame overlap(256-64)
[Comenergy] = kmeans(Energy,10);
[Comzcr] = kmeans(Zcr,10);
[V] = kmeans(mfccs,10);%Compression of data into a fixed size so that it can be fed to the Neural Network. This by means of K means
feature = [V,Comenergy,Comzcr];
feature = feature(:);
V = feature;

end

