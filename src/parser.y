%{
    #include <stdio.h>
    int yydebug=1;
    int yylex(void);
    
    int i;
    #define border printf("\n"); for(i=0; i<=80; ++i) { putchar('-'); } printf("\n");
    int yyerror(char *errorMsg);
    void success(char *successMsg);
%}

// tokens
%token ID NUMBER STRING_LIT STRING_VAR
%token EQ PLUS MINUS MUL DIVIDE LBRACKET RBRACKET SEMICOLON
%token PRINT KEYWORD

// set precedence
%right EQ
%left PLUS MINUS
%left MUL DIVIDE

%%

/* Parser Grammar */

start: stmt SEMICOLON {
            success("This is a valid python expression");
            YYACCEPT; 
        }
    ;

stmt:  assign_arithmetic
    |  assign_str
    |  display
    ;
    
identifier: ID | keyword { 
            yyerror("\nkeyword can't be used as a identifier\n"); 
            YYABORT; 
        }
    ;
        
keyword: PRINT | KEYWORD
    ;
    
assign_str:  identifier EQ strings
    ;

display: PRINT strings
    | PRINT strings MUL NUMBER
    | PRINT strings PLUS strings
    | PRINT expr
    ;
    
strings: STRING_LIT | STRING_VAR
    ;

assign_arithmetic: identifier EQ expr
    ;

expr: expr PLUS expr
    | expr MINUS expr
    | expr MUL expr
    | expr DIVIDE expr
    | factor
    | LBRACKET expr RBRACKET
    | SIGN factor
    ;

SIGN: PLUS
    | MINUS
    ;

factor: identifier 
    |   NUMBER
    ;

%%