#include <stdio.h>
#include <mysql.h>

#define HOST "localhost"
#define USER "root"
#define PASS "ubuntu"
#define DB "projeto"

void ver_paises(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="SELECT nome_pais FROM pais;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("%s",(campos[conta]).name);
				printf("|");  
             }
        
              printf("\n");
              printf("-------------------\n"); 

              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s\t",linhas[conta]);
					printf("\t");  
					printf("\t");
                 printf("\n");
              }
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_ligas(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select pais,nome_liga,divisao from liga;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("|"); 
              printf("%s",(campos[conta]).name);
			  printf("|\t   ");  
             }
        
              printf("\n");  
              printf("---------------------------------------\n"); 

              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s   ",linhas[conta]);              
                    printf("\n");}
                                 
          }  
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_treinadores(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select nome_treinador,nacionalidade from treinador;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("%s",(campos[conta]).name);
				printf("       |      ");  
             }
        
              printf("\n");  
               printf("---------------------------------------------------\n"); 

              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf(" %s   ",linhas[conta]);
              
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_clubes(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select liga,pais,nome_clube,nome_treinador from clube;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("|%s\t\t   ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-------------------------------------------------------------------------------------------------------\n");  
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf(" %s           ",linhas[conta]);            
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_jogadores(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select nome_jogador,nacionalidade,idade_jogador,rating,valor_de_mercado,salario_jogador,nome_clube from jogador order by valor_de_mercado desc ;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s  ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void treinamento(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select nome_treinador,clube,data_inicio,data_fim from treinamento;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s             ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_transferencias(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select nome_jogador,clube_antigo,clube_novo,valor_transferencia from transferencia;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s        ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retornar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_jogos(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select clube_local,golos_local,clube_visitante,golos_visitante from jogo;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s        ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retornar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s                 ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void ver_classificacoes(){
   MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   char query[]="select id_liga,id_clube,numero_golos,pontos from classificacao_semanal order by pontos desc;";
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s        ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retornar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void transferencia(){

     MYSQL conexao;
     int res;
     int id,novo_c;
     float valor;
     printf("id do jogador:\n");
     scanf("%d", &id);
     printf("id do novo clube:\n");
     scanf("%d", &novo_c);
     printf("valor da transferencia:\n");
     scanf("%f", &valor);
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call nova_transferencia(%d,%d,%f);",id,novo_c,valor);
		mysql_query(conn, query);
         mysql_close(conn); 
}
void novo_j(){

     MYSQL conexao;
     int res;
     int id,novo_c,id_p,idade,rating;
     float valor_m,valor_s;
     char nome[100];
     char pos[5];
     printf("id do clube:\n");
     scanf("%d",&id);
     printf("id do pais da nacionalidade:\n");
     scanf("%d",&id_p);
     printf("idade:\n");
     scanf("%d",&idade);
     printf("nome:\n");
     scanf("%s",nome );
     getchar();
     printf("rating[60-99]:\n");
     scanf("%d", &rating);
     printf("posicao:\n");
     scanf("%s",pos );
     getchar();
     printf("valor de mercado(em milhoes de euros):\n");
     scanf("%f", &valor_m);
     printf("salario(em mlhoes de euros):\n");
     scanf("%f", &valor_s);
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call inserir_jogador(%d,%d,%d,%s,%d,%s,%f,%f);",id,id_p,idade,nome,rating,pos,valor_m,valor_s);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void novo_t(){

     MYSQL conexao;
     int res;
     int id_p;
    
     char nome[100];
    
     printf("id do pais da nacionalidade:\n");
     scanf("%d",&id_p);
     printf("nome:\n");
     scanf("%s",nome );
     getchar();
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call inserir_treinador(%d,%s);",id_p,nome);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void novo_p(){

     MYSQL conexao;
     int res;   
     char nome[100];
   
     printf("nome do pais:\n");
     scanf("%s",nome );
     getchar();
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call inserir_pais(%s);",nome);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void novo_cl(){

     MYSQL conexao;
     int res,idl,idt;   
     char nome[100];
     printf("id da liga:\n");
     scanf("%d", &idl);
     printf("nome do clube:\n");
     scanf("%s",nome );
     getchar();
     
     
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call inserir_clube(%d,%s,NULL);",idl,nome);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void apaga_cl(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id do clube a apagar:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call apagar_clube(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void apaga_p(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id do pais a apagar:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call apagar_pais(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void apaga_t(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id do treinador a apagar:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call apagar_treinador(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void apaga_l(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id da liga a apagar:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call apagar_liga(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void apaga_j(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id do jogador a apagar:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call apagar_jogador(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void des(){

     MYSQL conexao;
     int res,id;   
     char nome[100];
     printf("id da equipa do treinador a despedir:\n");
     scanf("%d", &id);
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call despedir_treinador(%d);",id);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void cont(){

     MYSQL conexao;
     int res,id,idt;   
     char nome[100];
     printf("id do clube que contrata:\n");
     scanf("%d", &id);
     printf("id do treinador:\n");
     scanf("%d", &idt);
     
     
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call contratar_treinador(%d,%d);",id,idt);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void jogo(){
	

     MYSQL conexao;
     int res,idl,idv,gol,gov;   
     char nome[100];
     printf("id do clube local:\n");
     scanf("%d", &idl);
     printf("id do clube visitante:\n");
     scanf("%d", &idv);
     printf("golos do clube local:\n");
     scanf("%d", &gol);
     printf("golos do clube visitante:\n");
     scanf("%d", &gov);
     
      char query[2000];
      MYSQL *conn;
      conn = mysql_init(NULL);
       mysql_real_connect(conn, "localhost", "root", "ubuntu", "projeto", 0, NULL, 0);
       sprintf(query, "call novo_jogo(%d,%d,%d,%d);",idl,idv,gol,gov);
	   res=mysql_query(conn, query);
	   if (!res) printf("Registros inseridos %d\n", mysql_affected_rows(conn));
       else printf("Erro na inserção %d : %s\n", mysql_errno(conn), mysql_error(conn));
       
                mysql_close(conn); 
}
void p(){
  MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   int id;
   char query[2000];
   printf("id do clube\n");
   scanf("%d",&id);
   sprintf(query, "call plantel(%d);",id);
   
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s    ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void pn(){
  MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   int id;
   char nome[100];
   printf("nome a pesquisar:\n");
   scanf("%s",nome );
   char query[2000];
   sprintf(query, " call procurar_jogador_nome(%s);",nome);
   
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s             ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s          ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void classi(){
  MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   int id;
   char nome[100];
   printf("id da liga:\n");
   scanf("%d",&id );
   char query[2000];
   sprintf(query, " call classificacao_liga(%d);",id);
   
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s         ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s               ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}
void h(){
  MYSQL conexao;
   MYSQL_RES *resp;
   MYSQL_ROW linhas;
   MYSQL_FIELD *campos;
   int id;
   char nome[100];
   printf("id do treinador :\n");
   scanf("%d",&id );
   char query[2000];
   sprintf(query, " call historial_treinador(%d);",id);
   
   int conta; //Contador comum
   mysql_init(&conexao);
if (mysql_real_connect(&conexao,HOST,USER,PASS,DB,0,NULL,0))
   {
      if (mysql_query(&conexao,query))
         printf("Erro: %s\n",mysql_error(&conexao));
      else
      {
         resp = mysql_store_result(&conexao);//recebe a consulta
        if (resp) //se houver consulta
        {
           //passa os dados dos campos para a variável campos
           //escreve na tela os nomes dos campos dando
           //um tab somente
           campos = mysql_fetch_fields(resp);
           for (conta=0;conta<mysql_num_fields(resp);conta++) {
              printf("| %s                      ",(campos[conta]).name);
			
             }
        
              printf("\n");  
			  printf("-----------------------------------------------------------------------------------------------------------------------\n");
              //enquanto retonrnar registros, conta até o
              //número de colunas que a tabela tem e escreve na
              //tela com um tab, depois pula a linha e tenta
              //pegar outro registro
              while ((linhas=mysql_fetch_row(resp)) != NULL)
              {
                 for (conta=0;conta<mysql_num_fields(resp);conta++)
                    printf("%s                   ",linhas[conta]);         
                    printf("\n");}
                                 
          }
          mysql_free_result(resp);//limpa a variável do resultado: resp
        }
        mysql_close(&conexao);
   }
   else
   {
      printf("Conexao Falhou\n");
      if (mysql_errno(&conexao))
         printf("Erro %d : %s\n", mysql_errno(&conexao), mysql_error(&conexao));
   }
}


int main(void)
{
   int valor=1;
printf("\t\t|----------------------------------------------|\n");
printf("\t\t|---------------BEM-VINDO----------------------|\n");
printf("\t\t|---------- AO FOOTBALL ENGINE ----------------|\n");
printf("\t\t|----------------------------------------------|\n");
printf("\t\t\tDesenvolvido por David Alves\n");
printf("\n");
printf("A CONECTAR COM A BASE DE DADOS...\n");
printf("...\n");
printf("...\n");
printf("Conectado com Sucesso!\n");
printf("\n");

do{
printf ("\n");
printf ("ESCOLHA UMA OPÇÃO DO MENU:(0 para sair) \n");
printf ("[1]-LISTAR PAISES\n");
printf ("[2]-LISTAR LIGAS\n");
printf ("[3]-LISTAR TREINADORES\n");
printf ("[4]-LISTAR CLUBES\n");
printf ("[5]-LISTAR JOGADORES\n");
printf ("[6]-CENTRO DE EMPREGO\n");
printf ("[7]-LISTAR TRANSFERENCIAS\n");
printf ("[8]-LISTAR TODOS OS JOGOS\n");
printf ("[9]-LISTAR TODAS AS CLASSIFICACOES\n");
printf ("[10]-NOVA TRANSFERENCIA\n");
printf ("[11]-NOVO JOGADOR\n");
printf ("[12]-NOVO TREINADR\n");
printf ("[13]-NOVO PAIS\n");
printf ("[14]-NOVO CLUBE\n");
printf ("[15]-APAGAR CLUBE\n");
printf ("[16]-APAGAR PAIS\n");
printf ("[17]-APAGAR TREINADOR\n");
printf ("[18]-APAGAR LIGA\n");
printf ("[19]-APAGAR JOGADOR\n");
printf ("[20]-DESPEDIR TREINADOR\n");
printf ("[21]-CONTRATAR TREINADOR\n");
printf ("[22]-NOVO JOGO\n");
printf ("[23]-VER PLANTEL DE CLUBE\n");
printf ("[24]-PROCURAR JOGADOR PELO NOME\n");
printf ("[25]-CLASSIFICACAO DE UMA LIGA\n");
printf ("[26]-HISTORIAL DE UM TREINADOR \n");
scanf("%d", &valor);
 
	
	switch(valor)
        {
            case 1:
            ver_paises();
            break;
            
            case 2:
            ver_ligas();
            break;
            
            case 3:
            ver_treinadores();
            break;
            
            case 4:
            ver_clubes();
            break;
            
            case 5:
            ver_jogadores();
            break;
            
            case 6:
            treinamento();
            break;
            
            case 7:
            ver_transferencias();
            break;
            
             
            case 8:
            ver_jogos();
            break;
             
            case 9:
            ver_classificacoes();
            break;
             
            case 10:
            transferencia();
            break;
            
            case 11:
            novo_j();
            break;
            
            case 12:
            novo_t();
            break;
            
            case 13:
            novo_p();
            break;
            
            case 14:
            novo_cl();
            break;
            
            case 15:
            apaga_cl();
            break;
            
            case 16:
            apaga_p();
            break;
            
            case 17:
            apaga_t();
            break;
            
            case 18:
            apaga_l();
            break;
            
            case 19:
            apaga_j();
            break;
            
            case 20:
            des();
            break;
            
            case 21:
            cont();
            break;
              
            case 22:
            jogo();
            break;
            
            case 23:
            p();
            break;
            
            case 24:
            pn();
            break;
              
            case 25:
            classi();
            break;
            
            case 26:
            h();
            break;
            
            
            default:
                return 0;
        }
    } while(valor);
            
}


     


