Fs = 4000;
segundos = 2;



 %recordSound = audiorecorder(Fs,16,1);   %Cria��o do Objeto para Grava��o
 %disp('Comecar a falar...')
 %recordblocking(recordSound, segundos); %Grava��o por 2 segundos no Objeto
 %disp('Gravacao concluida')
 %play(recordSound);             %Reprodu��o do Objeto
 %pause(3);
 
 input_signal = getaudiodata(recordSound); %Convers�o do Objeto para um Array
 
%(x, wlen,fr, thresh, db_white_noise)

[noise, clean, SNR] = end_point (input_signal, 150, 0.5, 0.65, 0);

sound(clean, Fs); %faz "play" do som sem ruido
pause(1);
sound(noise, Fs); %faz "play" do som do ruido

 figure(1);
 subplot(3,1,1) 
 plot(input_signal,'color','b') 
 title('Sinal original','Color','b');
 subplot(3,1,2)
 plot(noise,'Color','r') 
 title('Ruido','Color','r');
 subplot(3,1,3)
 plot(clean,'Color','g')
 title('Voz','Color','g');