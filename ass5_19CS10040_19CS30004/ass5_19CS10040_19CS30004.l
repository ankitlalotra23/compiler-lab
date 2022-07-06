%{
	/* Grp No: 34
	   Name: Killada Gowtham Sai
	   Roll No: 19CS10040
	   Name: Ankit Lalotra
	   Roll No: 19CS30004
	   */
	
	#include <stdio.h>
	#include <string.h>
	#include "ass5_19CS10040_19CS30004_translator.h"
	#include "ass5_19CS10040_19CS30004.tab.h"
	extern YYSTYPE yylval;
	extern int l;
	int l = 1;
%}

/*Definition of regular expression*/
%option noyywrap

/* Regular Expression Definations */
KEYWORD1			"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"
KEYWORD2			"else"|"enum"|"extern"|"register"|"float"|"for"|"goto"|"if"|"inline"
KEYWORD3			"int"|"long"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"
KEYWORD4			"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"
KEYWORD			{KEYWORD1}|{KEYWORD2}|{KEYWORD3}|{KEYWORD4}

LETTER          		[a-zA-Z]
DIGIT           		[0-9]
NON_ZERO        		[1-9]

DIGIT_SEQ       		{DIGIT}{DIGIT}*
ESCAPE_SEQ      		"\\\'"|"\\\""|"\\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"

C_CHAR          		[^\'\\\n]|{ESCAPE_SEQ}
S_CHAR          		[^\"\\\n]|{ESCAPE_SEQ}
CHAR_SEQ        		{C_CHAR}{C_CHAR}*
STRING_SEQ      		{S_CHAR}{S_CHAR}*

IDENTIFIER      		({LETTER}|"_")({LETTER}|{DIGIT}|"_")*

FRAC            		{DIGIT_SEQ}\.|\.{DIGIT_SEQ}|{DIGIT_SEQ}\.{DIGIT_SEQ}
FLOAT_CONST     		({FRAC}|{DIGIT_SEQ})([Ee]([-+]{DIGIT_SEQ}|{DIGIT_SEQ}))|{FRAC}|"0"*\."0"*
INT_CONST       		{NON_ZERO}{DIGIT}*|"0"+
CHAR_CONST      		\'{CHAR_SEQ}\'

STRING          		\"{STRING_SEQ}\"|\"\"
COMMENT_LINE    		"//".*
COMMENT_MULTI   		"/*"([^*]|\*+[^/*])*\**(\*"/")? 
WS              		[ \t]
NEWLINE         		[\n]

PUNCTUATORS1			"["|"]"|"("|")"|"{"|"}"|"."|"->"
PUNCTUATORS2			"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"
PUNCTUATORS3			"/"|"%"|"<<"|">>"|"<"|">"|"<="|">=" 
PUNCTUATORS4			"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"
PUNCTUATORS5			";"|"..."|"="|"*="|"/="|"%="|"+="|"-="
PUNCTUATORS6			"<<="|">>="|"&="|"^="|"|="|","|"#"
PUNCTUATORS			{PUNCTUATORS1}|{PUNCTUATORS2}|{PUNCTUATORS3}|{PUNCTUATORS4}|{PUNCTUATORS5}|{PUNCTUATORS6}

%%

{COMMENT_LINE}			{ /*printf("This is a single line comment and which will be ignored by the parser\n");*/ }
{COMMENT_MULTI}		{ /*printf("This is a multi line comment and which will be ignored by the parser\n");*/  }

"break"			{ return BREAK;	}
"case"				{ return CASE;		}
"char"				{ return CHAR;		}
"const"			{ return CONST;	}
"continue"			{ return CONTINUE;	}
"default"			{ return DEFAULT;	}
"do"				{ return DO;		}
"double"			{ return DOUBLE;	} 

"else"				{ return ELSE;		}
"enum"				{ return ENUM;		}
"extern"			{ return EXTERN;	}
"float"			{ return FLOAT;	}
"for"				{ return FOR;		}
"goto"				{ return GOTO;		}
"if"				{ return IF;		}
"inline"			{ return INLINE;	}

"int"				{ return INT;		}
"long"				{ return LONG;		}
"restrict"			{ return RESTRICT;	}
"return"			{ return RETURN;	}
"short"			{ return SHORT;	}
"signed"			{ return SIGNED;	}
"sizeof"			{ return SIZEOF;	}
"static"			{ return STATIC;	}
"struct"			{ return STRUCT;	}

"switch"			{ return SWITCH;	}
"typedef"			{ return TYPEDEF;	}
"union"			{ return UNION;	}
"unsigned"			{ return UNSIGNED;	}
"void"				{ return VOID;		}
"volatile"			{ return VOLATILE;	}
"while"			{ return WHILE;	}


"..."				{ return DOTS;                 }
"<<="                   	{ return SL_EQ;                }
">>="                   	{ return SR_EQ;                }
"++"                    	{ return INC;                  }
"--"                    	{ return DEC;                  }
"->"                    	{ return IMPLIES;              }
"<<"                    	{ return SHIFT_LEFT;           }
">>"                    	{ return SHIFT_RIGHT;          }
"<="                    	{ return LTE;                  }
">="                    	{ return GTE;                  }
"=="                    	{ return EQ;                   }
"!="                    	{ return NEQ;                  }
"&&"                    	{ return AND;                  }
"||"                    	{ return OR;                   }
"*="                    	{ return STAR_EQ;              }
"/="                    	{ return DIV_EQ;               }
"%="                    	{ return MOD_EQ;               }
"+="                    	{ return ADD_EQ;               }
"-="                    	{ return SUB_EQ;               }
"&="                    	{ return BITWISE_AND_EQ;       }
"^="                    	{ return BITWISE_XOR_EQ;       }
"|="                    	{ return BITWISE_OR_EQ;        }

"["                     	{ return SQUARE_BRACKET_OPEN;  }
"]"                     	{ return SQUARE_BRACKET_CLOSE; }
"("                     	{ return ROUND_BRACKET_OPEN;   }
")"                     	{ return ROUND_BRACKET_CLOSE;  }
"{"                     	{ return CURLY_BRACKET_OPEN;   }
"}"                     	{ return CURLY_BRACKET_CLOSE;  }

";"                     	{ return SEMICOLON;  }

"#"                     	{ return HASH;       }
"."                     	{ return DOT;        }
"&"                     	{ return BITWISE_AND;}
"*"                     	{ return MUL;        }
"+"                     	{ return ADD;        }
"-"                     	{ return SUB;        }
"~"                     	{ return BITWISE_NOT;}
"!"                     	{ return EXCLAIM;    }
"/"                     	{ return DIV;        }
"%"                     	{ return MOD;        }
"<"                     	{ return BIT_SL;     }
">"                     	{ return BIT_SR;     }
","                     	{ return COMMA;      }
"="                     	{ return ASSIGN;     }
"?"                     	{ return QUESTION;   }
"^"                     	{ return BITWISE_XOR;}
"|"                     	{ return BITWISE_OR; }
":"                     	{ return COLON;      }

{INT_CONST}			{ 
				yylval.intval = atoi(yytext);
					return INTEGER_CONSTANT;
				}
                        
{CHAR_CONST}			{ 
				yylval.char_value = yytext;
					return CHARACTER_CONSTANT;
				}
				
{FLOAT_CONST}			{ 
				yylval.char_value = yytext;
					return FLOATING_CONSTANT;
				}

{IDENTIFIER}			{ 
				yylval.symp = ST->lookup(yytext);
					return IDENTIFIER;
				}

{STRING}			{ 
				yylval.char_value = yytext;
					return STRING_LITERAL;
				}

{WS}				{ /*White - Space Rule*/ }

{NEWLINE}			{ /* printf("\n\n |<-------------------- This is Parsing  LINE - %d -------------------->| \n\n", ++line ); */ }

%%

