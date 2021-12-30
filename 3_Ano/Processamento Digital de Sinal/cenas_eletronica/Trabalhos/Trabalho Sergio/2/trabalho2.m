
%%%%%%VARI�VEIS DE ENTRADA
    time_talk = 5
    fs = 8000                                                              
    nbits = 16                                                             
    nchannels = 1                                                        
    Length = 7;
    audio_file = 'C:\Users\sergi\OneDrive\Ambiente de Trabalho\Universidade\PDS\som8k.wav'
    SNR = 50      
    threshold = 0;
    fraction_of_ones = 0.35;
    index_jump = 1400;
    size_of_window = 1500;
    
 %%%%%%%%%%%%%%%%
 
 
%%%%%%GRAVA��O DO SINAL �UDIO 

record = audiorecorder(fs,nbits, nchannels)     %objeto para a grava��o de �udio       
message1 = ['Start speaking, you have ', num2str(time_talk), ' seconds']
disp(message1)
recordblocking(record, time_talk)       %grava o �udio durante 'time_talk' segundos
f = getaudiodata(record)
disp('End of Recording.')
audiowrite(audio_file,f,fs)     %escrita dos dados da grava��o num ficheiro .wav

plot(f)
figure(2)



%  filename = 'som8k.wav'
%  [f, fs] = audioread(filename)
 


%%%%%%%%%%%%%%%%

%%%A contaminar o ruido%%%
disp('A contaminar o sinal com o SNR desejado...')
    f_energy = power(f,2)             %c�lculo da energia do sinal de �udio
    f_energy = mean(f_energy)             %c�lculo da energia do sinal de �udio
    wn = randn(1,length(f))              %sinal de ru�do do tamanho do sinal de �udio A
    wn = wn - mean(wn)                           %m�dia 0
    wn = wn * sqrt(f_energy / (10^(SNR / 10)))                                
    contaminated = f + wn'                                                           
   
    plot(contaminated)
    figure(3)
    
 %%%a detetar as pausas%%%   
 disp('A eliminar todas as pausas...');
    if (SNR > 0 && SNR < 15) threshold = 0.45;
    elseif (SNR > 15 && SNR < 25) threshold = 0.5;      %o valor do treshold varia consoante o SNR escolhido
    elseif (SNR > 25 && SNR < 35) threshold = 0.6;
    elseif (SNR > 35 && SNR < 45) threshold = 0.75;
    else threshold = 0.8;
    end
    ruido = 0;
    fala = 0;
    cont_mean = mean(contaminated);        %c�lculo da m�dia do sinal 
    cont_desv = std(contaminated);         %c�lculo do desvio padr�o do sinal de �udio
    cont_array = 1:1:length(contaminated);     %array com o tamanho do sinal �udio onde s�o guardados os zeros e uns
    for i=1:length(contaminated)       %percorrer o sinal de �udio e colocar zeros e uns em cont_array
        if(abs(contaminated(i) - cont_mean) / cont_desv > threshold)               %se � um outlier (fala)
            cont_array(i) = 1;                                                      %coloca 1 no array
        else                                                                %se � ru�do
            cont_array(i) = 0;                                                      %coloca 0 no array
        end
    end
    n_ones = size_of_window * fraction_of_ones;              %quantidade de 1's para ser validado como fala
    n = 1;
    while(((n-1)*index_jump + size_of_window) < length(contaminated))                %se a grava��o ainda n�o acabou
        j = cont_array((n-1)*index_jump + 1 : (n-1)*index_jump + size_of_window);   %armazena a informa��o de 1 janela
        if sum(j) > n_ones                                                  %se for fala
            if ~fala                                                        %se o buffer da fala for nulo
                fala = contaminated((n-1)*index_jump + 1 : (n-1)*index_jump + size_of_window);
            else                                                            %concatena os buffers que cont�m fala
               fala = cat(1,fala,contaminated((n-1)*index_jump + 1 : (n-1)*index_jump + size_of_window));
            end
        else                                                                %se for ru�do
            if ~ruido                                                       %se o buffer do ruido for nulo
                ruido = contaminated((n-1)*index_jump + 1 : (n-1)*index_jump + size_of_window);
            else                                                            %concatena os buffers que cont�m ru�do
                ruido = cat(1,ruido,contaminated((n-1)*index_jump + 1 : (n-1)*index_jump + size_of_window));
            end
        end
        n=n+1;                         
    end
    
     subplot(3,1,1), plot(f,'Color','g')
     title('Sinal �udio a analisar','Color','g')
    subplot(3,1,2), plot(contaminated,'Color','r')                                     
    title('Sinal contaminado','Color','r');
    subplot(3,1,3), plot(fala,'Color','b')
    title('Sinal com intervalos de sil�ncio removidos','Color','b');
     sound(f)
     pause(5);
     sound(contaminated)
     pause(5);
    sound(fala);
    pause(5);


