build: parser.l parser.y
	yacc -d parser.y
	lex parser.l
	gcc lex.yy.c y.tab.c -o parser

debug: parser.l parser.y
	yacc -d --debug --verbose --graph parser.y
	lex parser.l
	gcc lex.yy.c y.tab.c -o parser

run:
	./parser

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h a.out parser y.output y.dot