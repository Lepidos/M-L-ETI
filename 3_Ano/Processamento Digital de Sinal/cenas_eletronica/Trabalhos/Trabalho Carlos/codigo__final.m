recording = audiorecorder(4000,8,1);    %cria o objecto para gravar
disp('Inicio da recording.')
recordblocking(recording, 2);           %grava o obejto por 2s
disp('Fim da recording.')
play(recording);                        %reproduz o objeto gravado
pause(3);
signal = getaudiodata(recording);       %converte do objeto para array

tamanho_janela = 130;                   %tamanho da janela a analisar  
fator = 0.6;                            %frac��o de 1s
numero_amostras = 4000;
n_seg = 8000;                           %numero de amostras por segundo


asnr = awgn(signal,3,'measured');       % atribui��o dos valores db do ruido branco de 0dB-50dB

media = mean(asnr(1:n_seg));
variancia = var(asnr(1:n_seg));                           

aux = 1:1:length(asnr);                 %cria matriz que guarda se � ruido ou fala

for a=1:length(asnr)                    %separa os sinais da fala, do ruido e guarda posi��es em aux                         
    if abs(asnr(a,1)-media)>sqrt(variancia)
        aux(a,1) = 1;                   %se for fala fica a 1 na posicao i                        
    else
        aux(a,1) = 0;                   %se for ruido fica a 0 na posicao i                             
    end
end

buffer_ruido = 0;                       % iniciar buffer ruido
buffer_fala = 0;                        % iniciar buffer fala

alpha = tamanho_janela * fator;         %fator de defini��o para verificar se � uma seq. de fala(com tantos 1's � fala)
   
inicio_janela = 1;                      %define o inicio da janela
fim_janela = tamanho_janela;

while((fim_janela < length(asnr)))       %caso n�o tenha chegado ao fim de toda a grava��o audio
    
    j = aux(inicio_janela:fim_janela);   %guarda a seq. correspondente a uma janela
    
    if sum(j) > alpha                    %caso n�mero de 1 for maio que a alpha - fala
        if ~buffer_fala                  %se ainda n�o houver o array da fala                     
            buffer_fala = asnr(inicio_janela:fim_janela);
        else                             %une os dois arrays que cont�m fala num s�
            buffer_fala = cat(1,buffer_fala,asnr(inicio_janela:fim_janela));
        end
        
    else                                  %caso n�mero de 1 for menor a alpha - ru�do
        if ~buffer_ruido                  %se ainda n�o houve o array ruido 
           buffer_ruido = asnr(inicio_janela:fim_janela);
        else                              %une os dois arrays que cont�m ru�do num s�
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
