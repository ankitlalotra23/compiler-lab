test: a.out

	@echo "\n\nTest File - 1 \narrays, loops and nested-loops :->"
	./a.out < ass5_19CS10040_19CS30004_test1.c > ass5_19CS10040_19CS30004_quads1.out
	@echo "Test File - 1 is Successfully Translated !\n\n"

	@echo "Test File - 2 \ntypecasting and pointers :->"
	./a.out < ass5_19CS10040_19CS30004_test2.c > ass5_19CS10040_19CS30004_quads2.out
	@echo "Test File - 2 is Successfully Translated !\n\n"
	
	@echo "Test File - 3 \ndeclarations and arithmetic operations :->"
	./a.out < ass5_19CS10040_19CS30004_test3.c > ass5_19CS10040_19CS30004_quads3.out
	@echo "Test File - 3 is Successfully Translated !\n\n"
		
	@echo "Test File - 4 \nfunction calling and conditional statements :->"
	./a.out < ass5_19CS10040_19CS30004_test4.c > ass5_19CS10040_19CS30004_quads4.out
	@echo "Test File - 4 is Successfully Translated !\n\n"
	
	@echo "Test File - 5 \nnested If-Else and recursive functions  :->"
	./a.out < ass5_19CS10040_19CS30004_test5.c > ass5_19CS10040_19CS30004_quads5.out
	@echo "Test File - 5 is Successfully Translated !\n\n"

	@echo "\nAll Test Files are Successfully Translated !!\n"

a.out: lex.yy.o ass5_19CS10040_19CS30004.tab.o ass5_19CS10040_19CS30004_translator.o
	g++ lex.yy.o ass5_19CS10040_19CS30004.tab.o ass5_19CS10040_19CS30004_translator.o -lfl

ass5_19CS10040_19CS30004_translator.o: ass5_19CS10040_19CS30004_translator.cxx ass5_19CS10040_19CS30004_translator.h
	g++ -c ass5_19CS10040_19CS30004_translator.h
	g++ -c ass5_19CS10040_19CS30004_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

ass5_19CS10040_19CS30004.tab.o: ass5_19CS10040_19CS30004.tab.c
	g++ -c ass5_19CS10040_19CS30004.tab.c

lex.yy.c: ass5_19CS10040_19CS30004.l ass5_19CS10040_19CS30004.tab.h ass5_19CS10040_19CS30004_translator.h
	flex ass5_19CS10040_19CS30004.l

ass5_19CS10040_19CS30004.tab.c: ass5_19CS10040_19CS30004.y
	bison -dtv ass5_19CS10040_19CS30004.y -W

ass5_19CS10040_19CS30004.tab.h: ass5_19CS10040_19CS30004.y
	bison -dtv ass5_19CS10040_19CS30004.y -W

clean:
	rm lex.yy.c\
	   lex.yy.o\
	   a.out\
	   ass5_19CS10040_19CS30004.tab.c\
	   ass5_19CS10040_19CS30004.tab.h\
	   ass5_19CS10040_19CS30004.tab.o\
	   ass5_19CS10040_19CS30004.output\
	   ass5_19CS10040_19CS30004_translator.o\
	   ass5_19CS10040_19CS30004_translator.h.gch\
	   ass5_19CS10040_19CS30004_quads1.out\
	   ass5_19CS10040_19CS30004_quads2.out\
	   ass5_19CS10040_19CS30004_quads3.out\
	   ass5_19CS10040_19CS30004_quads4.out\
	   ass5_19CS10040_19CS30004_quads5.out
	   
