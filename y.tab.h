/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    FLOAT = 259,
    DOUBLE = 260,
    CHAR = 261,
    SIN = 262,
    STRUCT = 263,
    LIB = 264,
    ID = 265,
    DEF = 266,
    IF = 267,
    ELSE = 268,
    WHILE = 269,
    DO = 270,
    START = 271,
    END = 272,
    READ = 273,
    RETURN = 274,
    SWITCH = 275,
    WRITE = 276,
    CASE = 277,
    DEFAULT = 278,
    THEN = 279,
    PRED = 280,
    TERM = 281,
    NUM = 282,
    NREAL = 283,
    CARAC = 284,
    CADENA = 285,
    FALSE = 286,
    TRUE = 287,
    SCOLON = 288,
    COMMA = 289,
    COLON = 290,
    DCOLON = 291,
    ASIGN = 292,
    ASIGN2 = 293,
    PLUS = 294,
    MINUS = 295,
    MUL = 296,
    DIV = 297,
    MOD = 298,
    LPAR = 299,
    RPAR = 300,
    LESS = 301,
    LESSEQ = 302,
    MORE = 303,
    MOREEQ = 304,
    NOTEQ = 305,
    OR = 306,
    AND = 307,
    NOT = 308
  };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define DOUBLE 260
#define CHAR 261
#define SIN 262
#define STRUCT 263
#define LIB 264
#define ID 265
#define DEF 266
#define IF 267
#define ELSE 268
#define WHILE 269
#define DO 270
#define START 271
#define END 272
#define READ 273
#define RETURN 274
#define SWITCH 275
#define WRITE 276
#define CASE 277
#define DEFAULT 278
#define THEN 279
#define PRED 280
#define TERM 281
#define NUM 282
#define NREAL 283
#define CARAC 284
#define CADENA 285
#define FALSE 286
#define TRUE 287
#define SCOLON 288
#define COMMA 289
#define COLON 290
#define DCOLON 291
#define ASIGN 292
#define ASIGN2 293
#define PLUS 294
#define MINUS 295
#define MUL 296
#define DIV 297
#define MOD 298
#define LPAR 299
#define RPAR 300
#define LESS 301
#define LESSEQ 302
#define MORE 303
#define MOREEQ 304
#define NOTEQ 305
#define OR 306
#define AND 307
#define NOT 308

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 9 "parser.y" /* yacc.c:1909  */

   int entero;
   float nreal;
   char carac;
   char *cade;

#line 167 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
