function [fala,ruido] = detetor_fala(fich_audio, noise_len, pause_len, espor_noise_len)
% detetor_fala -> fun��o que analisa o sinal de �udio e separa o ruido da
% fala atrav�s da cria��o de 2 vetores 
 
% Argumentos de entrada:
%   fich_audio: vetor com o sinal �udio a analisar
%   noise_len: n�mero de amostras inicias onde se grava ruido 
%   pause_len: dura��o do tempo de pausa permitido no segmento de
%   voz(amostras), normalmente 50
%   espor_noise_len: n�mero m�ximo de amostras que um ruido espor�dico pode tomar
 
% Argumentos de sa�da:
%   ruido: vetor que guarda o segmento de ruido (ruido removido)  
%   fala: vetor que guarda o segmento de fala sem ruido
 
    %Inicializa��es
    ruido=0;            %vetor segmento de ruido inicializado a 0    
    fala=0;             %vetor segmento de fala inicializado a 0 
    
    con_espor=0;        %vari�vel contador do n�mero de amostras para saber se o sinal obtido � espor�dico ou n�o
    con_pausa=0;        %vari�vel contador do n�mero de amostras para saber se o sinal obtido � uma pausa entre as falas ou n�o
    n_amostras=0;       %vari�vel auxiliar contador do n�mero de amostras
    
    SNR=(mean(fich_audio))/(std(fich_audio));   %SNR=media/desvio_padrao
    
    threshold=SNR*10;                           %threshold calcula um limite, que indica 
    if abs(threshold) < 1                       %qual � a probalidade de encontrar ruido ou fala
        threshold=2;
    end
    
    media=mean(fich_audio(1:noise_len));    %calculo da m�dia 
    dp=std(fich_audio(1:noise_len));        %calculo do desvio-padr�o do ruido inicial
    
    %Algoritmo da fun��o
    for i=1:length(fich_audio)                                                      %percorre-se o ficheiro de �udio e compara-se
        if abs(fich_audio(i)) > (media + abs(threshold)*dp)                         %se o valor do sinal � maior ao limite calculado � um segmento de fala 
           con_espor = con_espor+1;
           n_amostras = n_amostras+1;
           con_pausa=0;
           if(con_espor) > espor_noise_len                              %se o contador de amostras de ruido esporadico for maior que o valor recebido por par�metro
               fala=cat(1,fala,fich_audio(i-n_amostras+1:i));            %conta-se como um segmento de fala, sen�o � removido
               n_amostras=0;
           end 
        else                                                                        %sen�o � um segmento de ruido
            con_pausa=con_pausa+1;
            n_amostras = n_amostras+1;
            if con_pausa > pause_len                                    %se o contador da pausa for maior que o valor recebido por parametro assume-se que � ruido 
                ruido=cat(1,ruido,fich_audio(i-n_amostras+1:i));
                con_espor=0;
                n_amostras=0;
                con_pausa=0;
            end
        end
    end   
end



