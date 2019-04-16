# python parser

A simple parser for python made using lex yacc. 
It currently supports only selected python expressions as stated below.

## package requirements

- gnu's lex yacc `sudo apt-get install bison flex`
- make utility `sudo apt-get install build-essential`

## How to make

- go to source folder `cd src`
- `make clean` to remove old stuff lying around
- `make` to build : this will generate the usual files
- `make run` to execute
- 
## How to debug

- go to source folder `cd src`
- `make clean` to remove old stuff lying around
- `make debug` to build with debugging flags
- this will generate a lot of extra files. feel free to look through.
- `make run` to execute

## Assumptions

- each statement ends with semicolon

## Cases Handled

- arithmetic expressions along with brackets
    ```python
	a=5;
	a=5+24;
	a=rod;
	a=5*(4+3);
    ```

- string assignments
    ```python
 	var="hello";
	var='hello';
    ```

- print statements
	```python
    print 'hello';		# single quotes handled
	print "hello";		# double quotes handled
    ```

- keywords cant be identifiers

## Cases not handled

- Multiple Statements on a Single Line 
    ```python
    var=5; var2=6; var7=23;
    ```

- multi line statements -- a single statement written in multiple lines
    ```python
    var= 2+ \
        3+	\
        4
    ```

- static array initialisation not included  
    ```python
    var = [3,3,23];
    days = ['Monday', 'Tuesday', 'Wednesday','Thursday', 'Friday']
    ```

- single or multi line comments

- triple quote print statements - multiline strings
    ```
	print """hello""";
	print '''hello''';
    ```

- typecasting
    ```python
    print "hello" + str(5);
    ```

- shorthand operators not handled
    ```python
    var+=3;
    var+=2;
    ```

## Disclaimer

- This assignment covers only simple cases.
- Only to be used as a reference point.
- This code was made in 2015. Use at your own discretion.