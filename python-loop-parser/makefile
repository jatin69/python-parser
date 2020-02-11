build: loop-parser.l loop-parser.y
	yacc -d loop-parser.y
	lex loop-parser.l
	gcc lex.yy.c y.tab.c -o loop-parser

run:
	./loop-parser

debug: loop-parser.l loop-parser.y
	yacc -d --debug --verbose --graph loop-parser.y
	lex loop-parser.l
	gcc lex.yy.c y.tab.c -o debug-loop-parser

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h a.out loop-parser y.output y.dot
