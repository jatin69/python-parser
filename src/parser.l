%{ 
    #include <stdio.h>
    #include <stdlib.h>
    
    // obtained from yacc file
    #include "y.tab.h"        
    
    #define border printf("\n---------------------------------------------------------------------------------\n")
%}

%%
"print" return (PRINT);
"and"|"assert"|"break"|"class"|"def"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global" return (RARE);
"if"|"import"|"in"|"is"|"lambda"|"not"|"or"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield" return (RARE);

[0-9]+ return NUMBER;
[_a-zA-Z][_a-zA-Z0-9]* return ID ;

[ \t]           ;
\=              { return (EQ); }
\+              return (PLUS);
\-              return (MINUS);
\*              return (MUL);
\/              return (DIVIDE);
\(              return (LBRACKET);
\)              return (RBRACKET);
\;              return (SEMICOLON);
\"([^\"\n])*\"  return (STRING_LIT);
\'([^\'\n])*\'  return (STRING_VAR);  
.               { printf("\nunidentified token %s\n",yytext);  exit(1); }

%%