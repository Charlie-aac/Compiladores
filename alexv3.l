/*Fecha: 23/05/2020*/
/*Autor: JFUV*/
/*Descripcion: Se definen declaraciones en C y expresiones regulares */

%{ 
   int yylineno;
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   #include "tokens.h"
%}

%option yylineno
%option noyywrap


caracter       [a-zA-Z]
digito         [0-9]
estructura     (e|E)(s|S)(t|T)(r|R)(u|U)(c|C)(t|T)(u|U)(r|R)(a|A)
inicio         (i|I)(n|N)(i|I)(c|C)(i|I)(o|O)
fin            (f|F)(i|I)(n|N)
ent            (e|E)(n|N)(t|T)(" ")
real           (r|R)(e|E)(a|A)(l|L)
dreal          (d|D)(r|R)(e|E)(a|A)(l|L)
car            (c|C)(a|A)(r|R)
sin            (s|S)(i|I)(n|N)
num            {digito}+
nreal          ({digito})+"."({digito})*|"."({digito})*
def            (d|D)(e|E)(f|F)
entonces       (e|E)(n|N)(t|T)(o|O)(n|N)(c|C)(e|E)(s|S)
sino           (s|S)(i|I)(n|N)(o|O)
si             (s|S)(i|I)
hacer          (h|H)(a|A)(c|C)(e|E)(r|R)
mientras       (m|M)(i|I)(e|E)(n|N)(t|T)(r|R)(a|A)(s|S)
segun          (s|S)(e|E)(g|G)(u|U)(n|N)
escribir       (e|E)(s|S)(c|C)(r|R)(i|I)(b|B)(i|I)(r|R)
leer           (l|L)(e|E)(e|E)(r|R)
devolver       (d|D)(e|E)(v|V)(o|O)(l|L)(v|V)(e|E)(r|R)
terminar       (t|T)(e|E)(r|R)(m|M)(i|I)(n|N)(a|A)(r|R)
caso           (c|C)(a|A)(s|S)(o|O)
pred           (p|P)(r|R)(e|E)(d|D)
o              (o|O)
y              (y|Y)
no             (n|N)(o|O)
verdadero      (v|V)(e|E)(r|R)(d|D)(a|A)(d|D)(e|E)(r|R)(o|O)
falso          (f|F)(a|A)(l|L)(s|S)(o|O)
lib            ({caracter}+)(".h")
/*Fecha: 24/05/2020*/
/*Autor: CAAC*/
/*Descripcion: Se agrega la er para cadena y modifica er de id para definir longitud minima de dos*/
id             ({caracter}|"_"|"@")({caracter}|"_"|"@"|{digito})+
cadena         ("\/")([^\n\/]*([.])*)*("\/")
/*Fecha: 24/05/2020*/
/*Autor: CAAC*/
/*Descripcion: Se agregan reglas para los lexemas*/
%%

{ent}		{return INT;}
{real}		{return FLOAT;}
{dreal}		{return DOUBLE;}
{car}		{return CHAR;}
{sin}		{return SIN;}

{estructura}	{return STRUCT;}
{def}		{return DEF;}
{si}            {return IF;}
{sino}          {return ELSE;}
{mientras}      {return WHILE;}
{hacer}         {return DO;}
{inicio}	{return START;}
{fin}           {return END;}
{escribir}      {return WRITE;}
{leer}          {return READ;}
{devolver}	{return RETURN;}
{segun}		{return SWITCH;}
{caso}		{return CASE;}
{pred}     {return DEFAULT;}
{entonces} {return THEN;}
{terminar} {return TERM;}

{o}		{return OR;}
{y}		{return AND;}
{no}		{return NOT;}
{verdadero}	{return TRUE;}
{falso}		{return FALSE;}

{id}		{return ID;}
{lib}    {return LIB;}
"("  {return LPAR;}
")"  {return RPAR;}
"+"  {return PLUS;}
"-"  {return MINUS;}
"*"  {return MUL;}
"/"  {return DIV;}
"%"  {return MOD;}
"<"  {return LESS;}
"<=" {return LESSEQ;}
">"  {return MORE;}
">=" {return MOREEQ;}
"="  {return ASIGN;}
":=" {return ASIGN2;}
";"  {return SCOLON;}
","  {return COMMA;}
":"  {return DCOLON;}
"." {return COLON;}
"<>" {return NOTEQ;}
" " ;
{num} {return NUM;}
{caracter} {return CARAC;}
{cadena} {return CADENA;}
{nreal} {return NREAL;}

%%
/*Fecha: 2/05/2020*/
/*Autor: KMPBP*/
/*Descripcion: Se agrega funcion main para lectura de archivo y escritura de tokens con su valor en archivo .txt*/
FILE *yyin;


int main(int text, char **arch){
  if(text <2){
    printf("Falta el nombre del archivo\n");
  }
  yyin = fopen(arch[1], "r");
  
  FILE *yyout;
  yyout = fopen("tokensSal.txt", "w+"); //archivo donde se escriben los tokens

  int tokenVal;
  char tokenChar[10];
  tokenVal=yylex();
  while(tokenVal){
      printf("%s valor del token %i\n",yytext,tokenVal);
     fputs(yytext,yyout);
      fputs("  ",yyout);
      sprintf(tokenChar,"%d",tokenVal);
      fputs(tokenChar,yyout);
      fputs("\n",yyout);
      tokenVal=yylex();
  }
    return 0;
  printf("\n");

  fclose(yyin);
  fclose(yyout);
  return 0;
}
