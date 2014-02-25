clc
%
%Reading all the stored wav files from folder and generate the features
%
[pika1 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika1.wav');
pika1 = (speechfeatures(pika1,fs))';
[pika2 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika2.wav');
pika2 = (speechfeatures(pika2,fs))';
[pika3 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika3.wav');
pika3 = (speechfeatures(pika3,fs))';
[pika4 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika4.wav');
pika4 = (speechfeatures(pika4,fs))';
[pika5 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika5.wav');
pika5 = (speechfeatures(pika5,fs))';
[pika6 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika6.wav');
pika6 = (speechfeatures(pika6,fs))';
[pika7 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika7.wav');
pika7 = (speechfeatures(pika7,fs))';
[pika8 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Pikachu\pika8.wav');
pika8 = (speechfeatures(pika8,fs))';

[char1 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char1.wav');
char1 = (speechfeatures(char1,fs))';
[char2 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char2.wav');
char2 = (speechfeatures(char2,fs))';
[char3 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char3.wav');
char3 = (speechfeatures(char3,fs))';
[char4 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char4.wav');
char4 = (speechfeatures(char4,fs))';
[char5 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char5.wav');
char5 = (speechfeatures(char5,fs))';
[char6 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char6.wav');
char6 = (speechfeatures(char6,fs))';
[char7 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char7.wav');
char7 = (speechfeatures(char7,fs))';
[char8 fs] = wavread ('E:\CODES\MATLAB prg\Samples\Charizard\char8.wav');
char8 = (speechfeatures(char8,fs))';

[dragon1 fs] = wavread ('E:\CODES\MATLAB prg\Samples\dragon1');
dragon1 = (speechfeatures(dragon1,fs))';

clc
%
%Creating inputs, targets and outputs for the neural network
%
pokemoninput = [pika1; pika2; pika3; pika4; char1; char2; char3; char4];
pokemontest0 = [pika1; pika2; pika3; pika7; char1; char2; char8; char5];
pokemontest = [pika5; pika6; pika7; pika8; char5; char6; char7; char8];
pokemontest2 = [dragon1; dragon1; dragon1; dragon1; dragon1; dragon1; dragon1; dragon1];
a = zeros(1,70);
b = ones(1,70);
c = [a,b];
d = [b,a];
%pokemonoutput = [c;d];
pokemonoutput = [pika1;char1];
net = create_pr_net1(pokemoninput,pokemonoutput);
%
%testing and regression plots
%
y = round(sim(net,pokemoninput));
plotregression(pokemonoutput, y);

ytest0 = round(sim(net,pokemontest0));
plotregression(pokemonoutput, ytest0);

ytest = round(sim(net,pokemontest));
plotregression(pokemonoutput, ytest);

ytest2 = round(sim(net,pokemontest2));
plotregression(pokemonoutput, ytest2);
