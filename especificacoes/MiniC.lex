
package br.com.minic.analisadorlexico;

import br.com.minic.token.Token;

%%

%class AnalisadorLexico
%unicode
%type Token
%line
%column

LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACO_EM_BRANCO = [ ]
FINAL_LINHA = (\r | \n | \r\n | \t |\t\n)
SIMBOLOS = \: | \; | \( | \) | \{ | \} | \. | \# | \&

IDENTIFICADOR = ((\_ | {LETRA})({LETRA} | {DIGITO} | \_)*)
LITERAL_INTEIRO = {DIGITO}+
LITERAL_PONTO_FLUTUANTE = ({DIGITO}+ \. {DIGITO}+)
LITERAL_CHAR = (\'({ESPACO_EM_BRANCO} | {LETRA} | {DIGITO})?\')
LITERAL_STRING = (\"(({ESPACO_EM_BRANCO}) | (({DIGITO}) | ({LETRA}) | ({SIMBOLOS}) |\\r | \\n | \\t | \\\))*)\")

BIBLIOTECA = \< ({LETRA}+) \. \h \>

COMENTARIO = ("/*" [^*] ~"*/" | "*/" "*"+ "/") | ("//" [^\r\n]* (\n | \r\n | \t\n  | \r | \t)?) | ("/**" (( [^*] | \*+ [^/*] )*) "*"+ "/")

OPERADOR = (\+ | \- | \* | \/ | \== | \!= | \< | \> | \<= | \>= | \&& | \|\| | \= | \!)

%%

"char" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"else" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"if" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"int" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"float" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"double" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"main" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"printf" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"printint" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"printstr" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"return" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"static" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"void" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"while" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"for" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"do" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }
"include" { return new Token( "Palavra_Reservada", yyline, yycolumn, yytext() ); }

{LITERAL_INTEIRO} { return new Token( "LITERAL_INTEIRO", yyline, yycolumn, yytext() ); }
{SIMBOLOS} { return new Token( "SIMBOLO", yyline, yycolumn, yytext() ); }
{BIBLIOTECA} { return new Token( "BIBLIOTECA", yyline, yycolumn, yytext() ); }
{OPERADOR} { return new Token( "OPERADOR", yyline, yycolumn, yytext() ); }
{IDENTIFICADOR} { return new Token( "IDENTIFICADOR", yyline, yycolumn, yytext() ); }
{LITERAL_PONTO_FLUTUANTE} { return new Token( "LITERAL_PONTO_FLUTUANTE", yyline, yycolumn, yytext() ); }
{LITERAL_STRING} { return new Token( "LITERAL_STRING", yyline, yycolumn, yytext() ); }
{LITERAL_CHAR} { return new Token( "LITERAL_CHAR", yyline, yycolumn, yytext() ); }
{FINAL_LINHA} {}
{ESPACO_EM_BRANCO} { /*ignore*/ }
{COMENTARIO} {/* ignore */}

. {System.out.printf("error: unexpected char |%s|\n",yytext());}