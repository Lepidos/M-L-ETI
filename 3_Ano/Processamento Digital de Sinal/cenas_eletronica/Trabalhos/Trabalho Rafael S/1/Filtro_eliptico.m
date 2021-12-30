%Cria��o do Som
%gravacao=audiorecorder; %criar o Objecto
%disp('Inicio da Grava�ao.') 
%recordblocking(gravacao,4); %grava��o do audio por 4 segundos
%disp('Fim da Grava��o.')
%play(gravacao); %reprodu��o do Objecto(grava��o)
%y=getaudiodata(gravacao); %convers�o do Objecto da grava��o para um Array
%audiowrite('som.wav',y,8000); %escrita de um ficheiro .wav com o Array
%[y,Fs]=audioread('som.wav'); %leitura do ficheiro .wav

%fator de subamostragem
N=3;

%frequencia de amostragem
Fs=8000;

%Informa�oes do som 
info=audioinfo('som.wav');
disp(info);
[y,Fs]=audioread('som.wav'); %leitura do ficheiro .wav

%Caracteristicas do filtro
Rp=20*log(1.1); %ripple na banda passante 
Rs=60; %ripple na banda de rejei��o
banda_pass=4000/N;
banda_rej=banda_pass+0.2*banda_pass; %valores da banda de transi��o
wp=(banda_pass)/(Fs/2); %frequencia de corte
ws=(banda_rej)/(Fs/2); %frequencia de banda

%Cria��o do Filtro
[n,Wp]=ellipord(wp,ws,Rp,Rs); 
[b,a]=ellip(n,Rp,Rs,Wp); % Excerto de codigo para criacao do filtro
figure(1)
freqz(b,a)
title('Filtro Eliptico')

%Aplica�ao do filtro
sound_filtered=filter(b,a,y);
figure(2)
plot(y); %Gr�fico com Sinal de Entrada
title('Sinal Original e Sinal Filtrado')
hold on %Mant�m o plot atual
plot(sound_filtered,'g'); %Gr�fico com sinal original de entrada e Sinal filtrado a verde(g)
legend('Sinal Original de Entrada','Sinal Filtrado');
hold on %Mant�m o plot atual
result_sound=downsample(sound_filtered,N); %Downsample do som de entrada filtrado
figure(3)
plot(y);
hold on %Mant�m o plot atual
legend('Som de entrada');
title('Sinal ap�s Downsample')
plot(result_sound, 'r') %Gr�fico com Sinal filtrado ap�s downsample
legend('Sinal Original de Entrada','Sinal Filtrado');
%sound(result_sound,(fs/N);