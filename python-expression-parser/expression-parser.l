%{ 
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"        // obtained from yacc file
    
    int i;
    #define border printf("\n"); for(i=0; i<=80; ++i) { putchar('-'); } printf("\n");
    int yyerror(char *errorMsg);
    void success(char *successMsg);
%}

%%
"print" return (PRINT);
"and"|"assert"|"break"|"class"|"def"|"del"|"elif" return (KEYWORD);
"else"|"except"|"exec"|"finally"|"for"|"from"|"global" return (KEYWORD);
"if"|"import"|"in"|"is"|"lambda"|"not"|"or"|"pass"|"raise" return (KEYWORD);
"return"|"try"|"while"|"with"|"yield" return (KEYWORD);

[0-9]+                  return NUMBER;
[_a-zA-Z][_a-zA-Z0-9]*  return ID ;

[ \t]                   ;
\=                      return (EQ);
\+                      return (PLUS);
\-                      return (MINUS);
\*                      return (MUL);
\/                      return (DIVIDE);
\(                      return (LBRACKET);
\)                      return (RBRACKET);
\;                      return (SEMICOLON);
\"([^\"\n])*\"          return (STRING_LIT);
\'([^\'\n])*\'          return (STRING_VAR);  
.                       { printf("\nunidentified token %s\n", yytext);  exit(1); }

%%

int main() {
    printf("\n--------------------------- PYTHON EXPRESSION PARSER ---------------------------\n");
    printf("\nEnter a python expression : \n");
    yyparse();
    return 0;
}

void success(char *successMsg) {
    fprintf(stderr, "\n%s\n", successMsg);
    border;
}

int yyerror(char *errorMsg){
    fprintf(stderr, "\n%s\n", errorMsg);
    border;
}

int yywrap() {
  return 1;
}