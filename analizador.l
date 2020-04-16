%{ 
int count = 0; 
%} 

%% 
[A-zA-Z_][a-zA-Z_0-9]* {printf("%s es identifiacdor\n", yytext);} 
[();{},]* {printf("%s es simbolo de puntutacion\n", yytext);}
[-+*/%]   {printf("%s es simbolo de operacion aritmetica\n", yytext);}
[<>"<="">=""==""!="]   {printf("%s es simbolo de operacion relacional\n", yytext);}
=       {printf("%s es simbolo de operacion asignacion\n", yytext);}
.	 {printf("%s no es parte del alfabeto\n", yytext);} 
"if"    {printf("%s palabra reservada if\n", yytext);} 
"else"  {printf("%s palabra reservada else\n", yytext);} 
"while" {printf("%s palabra reservada while\n", yytext);} 
[1-9][0-9]*   {printf("%s constante numerica entera\n", yytext);} 
[[0-9]*.[0-9]+f|[0-9]+.[0-9]*f|[0-9]+.[0-9]+|[0-9]*.[0-9]+F|[0-9]+.[0-9]*F]    {printf("%s constante numerica decimal\n", yytext);} 
" "     {return 0;} 
\n {return 0;} 
%% 
int yywrap(){} 
int main(){ 

// Uncomment the lines below 
// to take input from file 
// FILE *fp; 
// char filename[50]; 
// printf("Enter the filename: \n"); 
// scanf("%s",filename); 
// fp = fopen(filename,"r"); 
// yyin = fp; 

yylex(); 

return 0; 
} 
