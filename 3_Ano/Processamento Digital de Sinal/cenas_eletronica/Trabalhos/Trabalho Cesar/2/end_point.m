 gravacao = audiorecorder(4000,8,1);   %Cria��o do Objeto para Grava��o
 disp('Inicio da gravacao.')
 recordblocking(gravacao, 2);%Grava��o por 2 segundos no Objeto
 disp('Fim da gravacao.')
 play(gravacao);             %Reprodu��o do Objeto
 pause(3);
signal = getaudiodata(gravacao); %Convers�o do Objeto para um Array

% fator = frac��o de 1's 
% tamanho_janela = tamanho da janela a analisar    
% numero_amostras = numero de amostras por segundo

tamanho_janela = 130;
fator = 0.6;
numero_amostras = 400;

%definir aqui os valores de dB para o ru�do branco
asnr = awgn(signal,0,'measured'); % sinal com ruido branco - 0 dB a 50 dB

%calculo da media
m = mean(asnr(1:numero_amostras));

%calculo da variancia
v = var(asnr(1:numero_amostras));                           

%cria��o de uma matriz para guardar 
% se amostra � ru�do ou fala
aux = 1:1:length(asnr);

%separar sinais de fala e de ruido e guardar posi��es em aux
for a=1:length(asnr)                          
    if abs(asnr(a,1)-m)>sqrt(v)
        %na posi��o i, guarda 1 se for fala
        aux(a,1) = 1;                         
    else
        %na posi��o i, guarda 0 se for ru�do
        aux(a,1) = 0;                               
    end
end

% inicializa��o dos buffers
buffer_ruido = 0;
buffer_fala = 0;
%fator de defini��o se � uma sequ�ncia de fala(com tantos 1's � fala)
alpha = tamanho_janela * fator; 
%define o inicio da janela   
inicio_janela = 1;
fim_janela = tamanho_janela;


while((fim_janela < length(asnr)))        %se ainda n�o se chegou ao fim de toda a grava��o audio
    
    j = aux(inicio_janela:fim_janela);%armazena a sequ�ncia correspondente a uma s� janela
    
    if sum(j) > alpha                              %se o n�mero de 1's for superior a alpha -- fala
        if ~buffer_fala                                    %se ainda n�o houve o array da fala                     
            buffer_fala = asnr(inicio_janela:fim_janela);
        else                                        %une os dois arrays que cont�m fala, num s� array
            buffer_fala = cat(1,buffer_fala,asnr(inicio_janela:fim_janela));
        end
        
    else                                            %se o n�mero de 1's for inferior a alpha -- ru�do
        if ~buffer_ruido                                   %se ainda n�o houve o array ruido 
           buffer_ruido = asnr(inicio_janela:fim_janela);
        else                                        %une os dois arrays que cont�m ru�do, num s� array
           buffer_ruido = cat(1,buffer_ruido,asnr(inicio_janela:fim_janela));
        end
    end

    inicio_janela = fim_janela;
    fim_janela = fim_janela + tamanho_janela;
end

snr = 20*log(mean(buffer_fala)/sqrt(var(buffer_ruido)));

figure(1);
subplot(3,1,1) 
plot(signal,'color','b') 
title('Sinal original','Color','b');
subplot(3,1,2)
plot(buffer_ruido,'Color','b') 
title('Ruido','Color','b');
subplot(3,1,3)
plot(buffer_fala,'Color','g')
title('Fala','Color','g');