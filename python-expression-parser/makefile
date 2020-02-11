build: expression-parser.l expression-parser.y
	yacc -d expression-parser.y
	lex expression-parser.l
	gcc lex.yy.c y.tab.c -o expression-parser

run:
	./expression-parser

debug: expression-parser.l expression-parser.y
	yacc -d --debug --verbose --graph expression-parser.y
	lex expression-parser.l
	gcc lex.yy.c y.tab.c -o debug-expression-parser

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h a.out expression-parser y.output y.dot
