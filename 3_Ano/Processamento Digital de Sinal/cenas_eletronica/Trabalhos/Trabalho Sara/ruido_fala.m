% n_seg = n� de amostras do segmento;
% fator = frac��o de 1's (outlier de amostras);
% step = avan�o na janela;
% janela = tamanho da janela a analisar

function [ruido, fala] = ruido_fala(x, n_seg, fator, step, tam_janela);

m = mean(x(1:n_seg));                               %c�lculo da m�dia
v = var(x(1:n_seg));                                %c�lculo da vari�ncia


a = 1:1:length(x);


for i=1:length(x)                                   %sinal original
    if abs(x(i)-m)>sqrt(v)
        a(i) = 1;                                   % |X - m| > ? (outlier) -- fala
    else
        a(i) = 0;                                   % |X - m| <= ? -- ruido
    end
end


% inicializa��o dos buffers
ruido = 0;
fala = 0;


alpha = tam_janela * fator;                         %fator de defini��o se � uma sequ�ncia de fala(com tantos 1's � fala)
n = 1;                                              %define o inicio da janela


while(((n-1)*step + tam_janela) < length(x))        %se ainda n�o se chegou ao fim de toda a grava��o audio
    
    j = a((n-1)*step + 1 : (n-1)*step + tam_janela);%armazena a sequ�ncia correspondente a uma s� janela
    
    if sum(j) > alpha                              %se o n�mero de 1's for superior a alpha -- fala
        if ~fala                                    %se ainda n�o houve o array da fala                     
            fala = x((n-1)*step + 1 : (n-1)*step + tam_janela);
        else                                        %une os dois arrays que cont�m fala, num s� array
            fala = cat(1,fala,x((n-1)*step + 1 : (n-1)*step + tam_janela));
        end
        
    else                                            %se o n�mero de 1's for inferior a alpha -- ru�do
        if ~ruido                                   %se ainda n�o houve o array ruido 
           ruido = x((n-1)*step + 1 : (n-1)*step + tam_janela);
        else                                        %une os dois arrays que cont�m ru�do, num s� array
           ruido = cat(1,ruido,x((n-1)*step + 1 : (n-1)*step + tam_janela));
        end
    end

        n=n+1;                                      %incrementa para a posi��o seguinte
end;

