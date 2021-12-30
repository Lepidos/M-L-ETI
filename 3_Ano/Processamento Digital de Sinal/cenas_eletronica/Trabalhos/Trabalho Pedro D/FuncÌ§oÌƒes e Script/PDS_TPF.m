fs = 44100;
bits = 16;
channel = 1;
device = 0;
tempo = 4;

disp('In�cio');

% -- Zona comentada porque j� gravei 
% a mensagem usada para todo o processo -- 
%recObj = audiorecorder(fs, bits, channel,0);
%get(recObj)
%disp('Start speaking.')
%recordblocking(recObj, tempo);
%disp('End of Recording.');
%play(recObj);
%original = getaudiodata(recObj); % guardo audio num array
%wavwrite(original, 44100, 'original');

%Leitura do ficheiro original, sem ru�do induzido.
[Y,FS,NBITS] = wavread('original');
figure(1);
title('Sinal Original');
xlabel('n');
ylabel('AMPLITUDE');
plot(Y);

% -- Fun��o para induzir ru�do e determinar SNR resultante --  
% [SNR] = snr_pds(Y);

[Y2,FS,NBITS] = wavread('snr8_23');
pause(5)
disp('A ouvir original com um dado SNR')
sound(Y2, 44100, 16);

% -- Fun��o para descobrir alpha correto, dado um SNR --
% alpha_pds(Y2);

%-- Fun��o para descobrir alpha correto, dado um SNR --    
 limpa_audio(Y2);
 


