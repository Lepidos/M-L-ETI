clear all
n=input('quantos termos?: ');
for i=1:n
    x(i)=input(['introduza o ', num2str(i), '�n�mero ']);
end
[a,b]=SomaProd(x);
disp('A soma �: ');disp(a);
disp('O produto �: ');disp(b);
