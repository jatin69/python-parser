%{ 
	#include "y.tab.h"

	#include <stdio.h>
	#include <stdlib.h>
	#define border printf("\n---------------------------------------------------------------------------------\n")
%}

%%

"print" return (PRINT);
"for" return FOR;
"in" return IN;
"range" return (RANGE);
"xrange" return (XRANGE);

"and"|"assert"|"break"|"class"|"def"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global" return (RARE);
"if"|"import"|"in"|"is"|"lambda"|"not"|"or"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield" return (RARE);

[0-9]+ return NUMBER;
[_a-zA-Z][_a-zA-Z0-9]* return ID ;

[ \t] ;
\(   return (LBRACKET);
\)   return (RBRACKET);
\:  return (COLON);
\,      return COMMA;
.     { printf("\nunidentified token %s\n",yytext);  exit(1);}
%%
