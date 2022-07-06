
/* Sir, we have make some changes in .l file which is taken from Assignment-3
we changed "KEYWORDS to KEYWORD" , "IDENTIFIERS to IDENTIFIER" , "CHARACTER_CONSTANT to CHAR_CONST" , "FRACTION_PART to FRAC_CONSTANT" , "FLOATING_CONSTANT to FLOAT_CONST"
and we changed "COMMENTS" section also
we used 'line' to indicate the line of code 
Finally, we have changed the return statements to indicate every token explicitly*/

%{
	#include "stdio.h"
	#include "y.tab.h"
	int line = 1;
%}

/* COMMENTS */
%x				COMMENT
%x				SINGLE_LINE_COMMENT

/* KEYWORDS */
KEYWORD1			"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"
KEYWORD2			"else"|"enum"|"extern"|"register"|"float"|"for"|"goto"|"if"|"inline"
KEYWORD3			"int"|"long"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"
KEYWORD4			"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"
KEYWORD			{KEYWORD1}|{KEYWORD2}|{KEYWORD3}|{KEYWORD4}

/* IDENTIFIERS */
DIGIT				[0-9]
IDENTIFIER			[a-zA-Z_][a-zA-Z0-9_]*

/* STRING_LITERALS */
S_CHAR				[^\"\n\\]|{ESCAPE_SEQUENCE}
S_CHAR_SEQUENCE		{S_CHAR}+
STRING_LITERAL			\"({S_CHAR_SEQUENCE})?\"

/* CONSTANTS */
INTEGER_CONSTANT		[1-9][0-9]*|[0]+

ESCAPE_SEQUENCE		"\\\'"|"\\\""|"\\\?"|"\\"|"\a"|"\b"|"\f"|"\n"|"\r"|"\t"|"\v"

C_CHAR				[^\'\n\\]|{ESCAPE_SEQUENCE}
C_CHAR_SEQUENCE		({C_CHAR})+
CHAR_CONSTANT			\'({C_CHAR_SEQUENCE})\'      
  
DIGIT_SEQUENCE			[0-9]+
EXPONENT_PART			([Ee]([+-]?)({DIGIT_SEQUENCE}))
FRAC_CONSTANT			{DIGIT_SEQUENCE}\.|{DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}
FLOAT_CONST			({DIGIT_SEQUENCE}{EXPONENT_PART})|({FRAC_CONSTANT}{EXPONENT_PART}?)
CONST				{INTEGER_CONSTANT}|{CHAR_CONSTANT}|{FLOAT_CONST}

/* PUNCTUATORS */
PUNCTUATORS1			"["|"]"|"("|")"|"{"|"}"|"."|"->"
PUNCTUATORS2			"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"
PUNCTUATORS3			"/"|"%"|"<<"|">>"|"<"|">"|"<="|">=" 
PUNCTUATORS4			"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"
PUNCTUATORS5			";"|"..."|"="|"*="|"/="|"%="|"+="|"-="
PUNCTUATORS6			"<<="|">>="|"&="|"^="|"|="|","|"#"
PUNCTUATORS			{PUNCTUATORS1}|{PUNCTUATORS2}|{PUNCTUATORS3}|{PUNCTUATORS4}|{PUNCTUATORS5}|{PUNCTUATORS6}

%%

"auto"				{ return(AUTO);	}
"break"			{ return(BREAK);	}
"case"				{ return(CASE);	}
"char"				{ return(CHAR);	}
"const"			{ return(CONST);	}
"continue"			{ return(CONTINUE);	}
"default"			{ return(DEFAULT);	}
"do"				{ return(DO);		}
"double"			{ return(DOUBLE);	} 

"else"				{ return(ELSE);	}
"enum"				{ return(ENUM);	}
"extern"			{ return(EXTERN);	}
"register"			{ return(REGISTER);	}
"float"			{ return(FLOAT);	}
"for"				{ return(FOR);		}
"goto"				{ return(GOTO);	}
"if"				{ return(IF);		}
"inline"			{ return(INLINE);	}

"int"				{ return(INT);		}
"long"				{ return(LONG);	}
"restrict"			{ return(RESTRICT);	}
"return"			{ return(RETURN);	}
"short"			{ return(SHORT);	}
"signed"			{ return(SIGNED);	}
"sizeof"			{ return(SIZEOF);	}
"static"			{ return(STATIC);	}
"struct"			{ return(STRUCT);	}

"switch"			{ return(SWITCH);	}
"typedef"			{ return(TYPEDEF);	}
"union"			{ return(UNION);	}
"unsigned"			{ return(UNSIGNED);	}
"void"				{ return(VOID);	}
"volatile"			{ return(VOLATILE);	}
"while"			{ return(WHILE);	}
"_Bool"			{ return(BOOL);	}
"_Complex"			{ return(COMPLEX);	}
"_Imaginary"			{ return(IMAGINARY);	}

{IDENTIFIER}			{ return IDENTIFIER;	}
{STRING_LITERAL}		{ return STRING_LITERAL;	}
{INTEGER_CONSTANT}		{ return INT_CONST;	}
{FLOAT_CONST}			{ return FLOAT_CONST;	}
{CHAR_CONSTANT}		{ return CHAR_CONST;	}
"\n"				{ line++; printf("|<-------------------- LINE - %d -------------------->|\n", line); }
{ESCAPE_SEQUENCE}|" "                     

"/*"				{ BEGIN(COMMENT);	}
<COMMENT>"*/"			{ BEGIN(INITIAL);	}
<COMMENT>.				{ 			}
<COMMENT>"\n"			{ line++; printf("%d\n", line);}

"//"				{ BEGIN(SINGLE_LINE_COMMENT);	}
<SINGLE_LINE_COMMENT>"\n"	{ line++; BEGIN(INITIAL);	}
<SINGLE_LINE_COMMENT>.		{ 			}    
			
"["				{ return('[');		}
"]"				{ return(']');		}
"("				{ return('(');		}
")"				{ return(')');		}
"{"				{ return('{');		}
"}"				{ return('}');		}
"."				{ return('.');		}
"->"				{ return(ARROW);	} 

"++"				{ return(INCREMENT);	}
"--"				{ return(DECREMENT);	}
"&"				{ return('&');		}
"*"				{ return(MULT);	}
"+"				{ return('+');		}
"-"				{ return(MINUS);	}
"~"				{ return('~');		}
"!"				{ return('!');		}

"/"				{ return('/');		}
"%"				{ return('%');		}
">>"				{ return(RSHIFT);	}
"<<"				{ return(LSHIFT);	}
"<"				{ return('<');		}
">"				{ return('>');		}
"<="				{ return(LEQ);		}
">="				{ return(GEQ);		}

"=="				{ return(EQ);		}
"!="				{ return(NEQ);		} 
"^"				{ return('^');		} 
"|"				{ return('|');		}
"||"				{ return(OR);		}
"&&"				{ return(AND);		}
"?"				{ return('?');		}
":"				{ return(':');		}

";"				{ return(';');		}
"..."				{ return(ELLIPSIS);	}
"="				{ return('=');		}
"*="				{ return(MULT_ASSIGN);	}
"/="				{ return(DIV_ASSIGN);	}
"%="				{ return(MOD_ASSIGN);	}
"+="				{ return(ADD_ASSIGN);	}
"-="				{ return(SUB_ASSIGN);	}

"<<="				{ return(LSHIFT_ASSIGN);	}
">>="				{ return(RSHIFT_ASSIGN);	}
"&="				{ return(BIN_AND_ASSIGN);	}
"^="				{ return(BIN_XOR_ASSIGN);	}
"|="				{ return(BIN_OR_ASSIGN);	}
","				{ return(',');			}
"#"				{ return('#');			}

%%

