%{
#include <stdio.h>
int comentarios = 0;						
%}

TOKEN_NUMERO    [0-9]+
TOKEN_ID        [a-zA-Z][a-zA-Z0-9]*
TOKEN_COMENTARIO "//".*|"/*"([^*]|"*"[^/])*"*/"

%%

"int"|"float"|"double"|"char"|"if"|"else"|"while"|"for"|"return"|"using"|"namespace" {
    printf("Palabra Reservada: %s\n", yytext);
}

{COMENTARIO}    { comentarios++; printf("Comentario: %s\n", yytext); }
{ID}            { printf("Variable: %s\n", yytext); }
{NUMERO}        { printf("Numero: %s\n", yytext); }

"+" | "-" | "*" | "/" | "="   { printf("Operador Aritmetico: %s\n", yytext); }
"=="|"!="|"<"|">"|"&&"|"||" { printf("Operador Logico: %s\n", yytext); }
[(){}\[\];,:]          { printf("Simbolo: %s\n", yytext); }

[ \t\n]         ; 
.               ; 

%%

int main() {
    yylex();
    printf("\nTotal comentarios: %d\n", comentarios);
    return 0;
}

