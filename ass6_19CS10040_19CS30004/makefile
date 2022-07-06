assembly: tinyC libass2_19CS10040.a

	@echo "\n******************** Generating Quads for the test files ********************\n"

	./tinyC 1 > ass6_19CS10040_19CS30004_quads1.out
	./tinyC 2 > ass6_19CS10040_19CS30004_quads2.out
	./tinyC 3 > ass6_19CS10040_19CS30004_quads3.out
	./tinyC 4 > ass6_19CS10040_19CS30004_quads4.out
	./tinyC 5 > ass6_19CS10040_19CS30004_quads5.out

	@echo "\n******************** Generating the object files from assembly code ********************\n"

	gcc -c ass6_19CS10040_19CS30004_1.s
	gcc -c ass6_19CS10040_19CS30004_2.s
	gcc -c ass6_19CS10040_19CS30004_3.s
	gcc -c ass6_19CS10040_19CS30004_4.s
	gcc -c ass6_19CS10040_19CS30004_5.s

	@echo "\n******************** Compiling the test files ********************\n"

	gcc ass6_19CS10040_19CS30004_1.o -o test1 -L. -lass2_19CS10040 -no-pie
	gcc ass6_19CS10040_19CS30004_2.o -o test2 -L. -lass2_19CS10040 -no-pie
	gcc ass6_19CS10040_19CS30004_3.o -o test3 -L. -lass2_19CS10040 -no-pie
	gcc ass6_19CS10040_19CS30004_4.o -o test4 -L. -lass2_19CS10040 -no-pie
	gcc ass6_19CS10040_19CS30004_5.o -o test5 -L. -lass2_19CS10040 -no-pie

	@echo "\n------------------- Use ./test<i> for testing the ith file  ---------------------\n"

libass2_19CS10040.a:
	gcc -c ass2_19CS10040.c
	ar -rcs libass2_19CS10040.a ass2_19CS10040.o

tinyC: lex.yy.o ass6_19CS10040_19CS30004.tab.o ass6_19CS10040_19CS30004_translator.o ass6_19CS10040_19CS30004_target_translator.o
	g++ lex.yy.o ass6_19CS10040_19CS30004.tab.o ass6_19CS10040_19CS30004_translator.o \
	ass6_19CS10040_19CS30004_target_translator.o -lfl -o tinyC

ass6_19CS10040_19CS30004_target_translator.o: ass6_19CS10040_19CS30004_target_translator.cxx
	g++ -c ass6_19CS10040_19CS30004_target_translator.cxx

ass6_19CS10040_19CS30004_translator.o: ass6_19CS10040_19CS30004_translator.cxx ass6_19CS10040_19CS30004_translator.h
	g++ -c ass6_19CS10040_19CS30004_translator.h
	g++ -c ass6_19CS10040_19CS30004_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

ass6_19CS10040_19CS30004.tab.o: ass6_19CS10040_19CS30004.tab.c
	g++ -c ass6_19CS10040_19CS30004.tab.c

lex.yy.c: ass6_19CS10040_19CS30004.l ass6_19CS10040_19CS30004.tab.h ass6_19CS10040_19CS30004_translator.h
	flex ass6_19CS10040_19CS30004.l

ass6_19CS10040_19CS30004.tab.c: ass6_19CS10040_19CS30004.y
	bison -dtv ass6_19CS10040_19CS30004.y -W

ass6_19CS10040_19CS30004.tab.h: ass6_19CS10040_19CS30004.y
	bison -dtv ass6_19CS10040_19CS30004.y -W

clean:
	rm lex.yy.c\
	   ass6_19CS10040_19CS30004.tab.c\
	   ass6_19CS10040_19CS30004.tab.h\
	   lex.yy.o\
	   ass6_19CS10040_19CS30004.tab.o\
	   ass6_19CS10040_19CS30004.output\
	   ass6_19CS10040_19CS30004_translator.o\
	   test1\
	   test2\
	   test3\
	   test4\
	   test5\
	   tinyC\
	   ass6_19CS10040_19CS30004_target_translator.o\
	   ass6_19CS10040_19CS30004_translator.h.gch\
	   ass6_19CS10040_19CS30004_quads1.out\
	   ass6_19CS10040_19CS30004_quads2.out\
	   ass6_19CS10040_19CS30004_quads3.out\
	   ass6_19CS10040_19CS30004_quads4.out\
	   ass6_19CS10040_19CS30004_quads5.out\
	   libass2_19CS10040.a\
	   ass2_19CS10040.o\
	   ass6_19CS10040_19CS30004_1.o\
	   ass6_19CS10040_19CS30004_2.o\
	   ass6_19CS10040_19CS30004_3.o\
	   ass6_19CS10040_19CS30004_4.o\
	   ass6_19CS10040_19CS30004_5.o\
	   ass6_19CS10040_19CS30004_1.s\
	   ass6_19CS10040_19CS30004_2.s\
	   ass6_19CS10040_19CS30004_3.s\
	   ass6_19CS10040_19CS30004_4.s\
	   ass6_19CS10040_19CS30004_5.s\

