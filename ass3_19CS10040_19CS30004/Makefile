output_19CS10040_19CS30004.txt: a.out ass3_19CS10040_19CS30004_test.c
			./a.out < ass3_19CS10040_19CS30004_test.c > ass3_19CS10040_19CS30004.txt

a.out: lex.yy.c
	cc lex.yy.c -lfl

lex.yy.c: ass3_19CS10040_19CS30004.l
	flex ass3_19CS10040_19CS30004.l ass3_19CS10040_19CS30004.c

clean:
	rm a.out lex.yy.c
	
