/*Fecha: 25/05/2020
Autor: KMBP
Descripcion: Se definen las declaraciones en C y los tokens del parser */
/*Declaraciones */
%{
#include <stdio.h>
#include <string.h>
void yyerror(char *s);
extern char *yytext;
%}

%union {
   int entero;
   float nreal;
   char carac;
   char *cade;
}
%token INT
%token FLOAT
%token DOUBLE
%token CHAR
%nonassoc SIN
%token STRUCT
%token LIB
%token ID

%token DEF
%token IF
%token ELSE
%token WHILE
%token DO
%token START
%token END
%token READ
%token RETURN
%token SWITCH
%token WRITE
%token CASE
%token DEFAULT
%token THEN
%token PRED
%token TERM

%token<entero> NUM
%token<nreal> NREAL
%token<carac> CARAC
%token<cade> CADENA

%token FALSE TRUE 

%token SCOLON COMMA COLON DCOLON
/*Fecha: 25/05/2020
Autor: JFUV
Descripcion: Se define precedencia de tokens */
%right ASIGN ASIGN2

%left PLUS MINUS
%left MUL DIV
%left MOD

%nonassoc LPAR RPAR

%left LESS LESSEQ MORE MOREEQ NOTEQ

%left OR
%left AND
%left NOT


%start PROGRAMA
/*Fecha: 26/05/2020
Autor: CAAC
Descripcion: Se define el esquema de traduccion */
%%

/*Esquema de traduccion */

PROGRAMA : DECLARACIONES FUNCIONES;
DECLARACIONES : TIPO LISTA_VAR DECLARACIONES
               | TIPO_REGISTRO LISTA_VAR SCOLON DECLARACIONES
               |/*vacio*/;
TIPO_REGISTRO : STRUCT START DECLARACIONES END;
TIPO : BASE
       | TIPO_ARREGLO;
BASE : INT | FLOAT | DOUBLE | CHAR | SIN ;
TIPO_ARREGLO : LPAR NUM RPAR TIPO_ARREGLO 
            |/*vacio*/;
LISTA_VAR : ID LISTA_VAR_P ;
LISTA_VAR_P : COMMA ID LISTA_VAR_P 
            |/*vacio*/;
FUNCIONES : DEF TIPO ID LPAR ARGUMENTOS RPAR START DECLARACIONES SENTENCIAS END FUNCIONES 
            |/*vacio*/;
ARGUMENTOS : LISTA_ARG | SIN;
LISTA_ARG : ARG LISTA_ARG_P;
LISTA_ARG_P : COMMA ARG LISTA_ARG_P 
            |/*vacio*/;
ARG : TIPO_ARG ID;
TIPO_ARG : BASE PARAM_ARR;
PARAM_ARR : LPAR RPAR PARAM_ARR 
            |/*vacio*/;
SENTENCIAS : SENTENCIA SENTENCIAS_P;
SENTENCIAS_P : SENTENCIA SENTENCIAS_P | ;
SENTENCIA : IF E_BOOL THEN SENTENCIA END 
            | IF E_BOOL THEN SENTENCIA ELSE SENTENCIA END
            | WHILE E_BOOL DO SENTENCIA END
            | DO SENTENCIA WHILE E_BOOL SCOLON
            | SWITCH LPAR VARIABLE RPAR DO CASES PREDETERMINADO END
            | VARIABLE ASIGN2 EXPRESION SCOLON
            | WRITE EXPRESION SCOLON
            | READ VARIABLE SCOLON
            | RETURN SCOLON
            | RETURN EXPRESION SCOLON
            | TERM SCOLON
            | START SENTENCIAS END;
CASES : CASE NUM DCOLON SENTENCIA CASES
            | CASE NUM DCOLON SENTENCIA;
PREDETERMINADO : PRED DCOLON SENTENCIA 
            |/*vacio*/;
E_BOOL : NOT E_BOOL E_BOOL_P
            | LPAR E_BOOL RPAR E_BOOL_P
            | RELACIONAL E_BOOL_P
            | TRUE E_BOOL_P
            | FALSE E_BOOL_P;
E_BOOL_P : OR E_BOOL E_BOOL_P
            | AND E_BOOL E_BOOL_P
            |/*vacio*/;
RELACIONAL : EXPRESION RELACIONAL_P;
RELACIONAL_P: MORE RELACIONAL RELACIONAL_P
            | LESS RELACIONAL RELACIONAL_P
            | MOREEQ RELACIONAL RELACIONAL_P
            | LESSEQ RELACIONAL RELACIONAL_P
            | NOTEQ RELACIONAL RELACIONAL_P
            | ASIGN RELACIONAL RELACIONAL_P
            |/*vacio*/;
EXPRESION : LPAR EXPRESION RPAR EXPRESION_P
            | VARIABLE EXPRESION_P
            | NUM EXPRESION_P
            | CADENA EXPRESION_P
            | CARAC EXPRESION_P;
EXPRESION_P : PLUS EXPRESION EXPRESION_P
            | MINUS EXPRESION EXPRESION_P
            | MUL EXPRESION EXPRESION_P
            | DIV EXPRESION EXPRESION_P
            | MOD EXPRESION EXPRESION_P
            |/*vacio*/;
VARIABLE : ID VARIABLE_COMP;
VARIABLE_COMP : DATO_EST_SIM
            | ARREGLO
            | LPAR PARAMETROS RPAR;
DATO_EST_SIM : DATO_EST_SIM_P;
DATO_EST_SIM_P : COLON ID DATO_EST_SIM_P
            |/*vacio*/;
ARREGLO : LPAR EXPRESION RPAR ARREGLO_P;
ARREGLO_P : LPAR EXPRESION RPAR ARREGLO_P
            |/*vacio*/;
PARAMETROS : LISTA_PARAM
            |/*vacio*/;
LISTA_PARAM : EXPRESION LISTA_PARAM_P;
LISTA_PARAM_P : COMMA EXPRESION LISTA_PARAM_P
            |/*vacio*/;

%%
/*Fecha: 25/05/2020
Autor: JFUV
Descripcion: Se define funcion yyerror con su respectivo print */
/*Fecha: 26/05/2020
Autor: JFUV
Descripcion: Se agrega la impresion de yytext para determinar donde se produce el error */
/*Codigo de usuario*/
void yyerror(char* s){
   printf("Error Sintactico: %s, para la cadena: %s\n",s,yytext);
}
