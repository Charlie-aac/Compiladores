/*Fecha: 26/05/2020*/
/*Autor: CAAC*/
/*Descripcion: Se define funcion main para lectura de archivo y se agrega if para validar cadena aceptada*/
#include <stdio.h>
extern int yyparse();
extern FILE *yyin;

int main(int argc, char **argv){
      FILE *f;
      if(argc<2){
         printf("Faltan Argumentos\n");
         return -1;
      }
      f=fopen(argv[1],"r");
      if(!f){
         printf("El archivo %s no se puede abrir\n", argv[1]);
         return -1;
      }
      yyin = f;
      if(yyparse() == 0){
         printf("La cadena ha sido aceptada\n");
      }
      return 0;
}
