
// cases covered in here
// for i in var 
// for i in range(func())
// for i in range(1,50,10)
// for i in xrange(1,10) 
// for i in xrange(1,10,2)
    
%{
#include <stdio.h>
#define border printf("\n---------------------------------------------------------------------------------\n")
int yydebug=1;
%}


%token ID NUMBER
%token  LBRACKET RBRACKET COLON FOR IN RANGE XRANGE COMMA
%token PRINT RARE

/// set precedence
%right EQ
%left PLUS MINUS
%left MUL DIVIDE
%%

start : stmt COLON { printf("\nThis is a valid python expression\n"); border; YYACCEPT;}

stmt:  simple changes

simple: FOR identifier IN 

changes: identifier
        |range
        | xrange
        
range: RANGE LBRACKET myrange RBRACKET
    | RANGE LBRACKET myfunc RBRACKET
    
myfunc: identifier LBRACKET RBRACKET

myrange : NUMBER 
        | NUMBER COMMA NUMBER
        | NUMBER COMMA NUMBER COMMA NUMBER
        
        
xrange: XRANGE LBRACKET myrange RBRACKET

identifier: ID
        | keyword { yyerror("\nkeyword can't be used as a identifier\n"); YYABORT; }
        
keyword:    PRINT 
        | FOR
        | IN
        | RANGE
        | XRANGE
        |   RARE
    
%%

main() {
printf("\n--------------------------- PYTHON FOR LOOP PARSER ---------------------------\n");
printf("\nEnter FOR loop: \n");
return yyparse();
}
yyerror(s)
char *s;
{
printf("\n%s \n", s);
border;
}
yywrap()
{
  return(1);
}
