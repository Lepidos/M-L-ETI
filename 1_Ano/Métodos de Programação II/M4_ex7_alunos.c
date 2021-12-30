#include <stdio.h>

/* ******************* MODULO 4: EXERCICIO 7 ***************************
Escrever um inteiro (int) em mem�ria (por exemplo, 3F2E1D0C em hex).
Ler os 4 bytes, um a um, da mem�ria onde se escreveu o inteiro anterior
e tirar conclus�es sobre o tipo de ordena��o usada para armazenar
os bytes dum inteiro em mem�ria.
************************************************************************ */
int main() {

    int            iVal = 0x3F2E1D0C;
    unsigned char *byte;

    byte = (unsigned char *) &iVal;

    printf("INTEIRO             = %x\n",iVal);
    printf("ENDERECO DO INTEIRO = %p\n\n",&iVal);

    printf(" |    |\n");
    printf(" | %02x | <- %p\n", *(byte+3), byte+3); // MSByte
    printf(" | %02x | <- %p\n", *(byte+2), byte+2);
    printf(" | %02x | <- %p\n", *(byte+1), byte+1);
    printf(" | %02x | <- %p\n", *(byte+0), byte  ); // LSByte
    printf(" |    |\n");

    return 0;
}
