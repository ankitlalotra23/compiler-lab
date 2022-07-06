/* Grp No: 34
   Names: Killada Gowtham Sai, Ankit Lalotra
   Roll No's: 19CS10040, 19CS30004
*/

%{
    #include	"stdio.h"
    
    #define	KEYWORDS 1
    #define	IDENTIFIERS 2
    #define	STRING_LITERAL 3
    #define	INTEGER_CONSTANT 4
    #define	FLOATING_CONSTANT 5
    #define	CHARACTER_CONSTANT 6
    #define	PUNCTUATORS 7
    #define	MULTI_LINE_COMMENT 8
    #define	SINGLE_LINE_COMMENT 9
    #define	WS 10
    
%}

/* COMMENTS */
SINGLE_LINE_COMMENT			"//"[^("\n")]*
MULTI_LINE_COMMENT			"/*"[^"*"]*"*"("*"|([^"/*"]*[^"*"]*"*"))*"/"

/* KEYWORDS */
KEYWORDS1				"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"
KEYWORDS2				"else"|"enum"|"extern"|"register"|"float"|"for"|"goto"|"if"|"inline"
KEYWORDS3				"int"|"long"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"
KEYWORDS4				"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"
KEYWORDS				{KEYWORDS1}|{KEYWORDS2}|{KEYWORDS3}|{KEYWORDS4}

/* IDENTIFIERS */
DIGIT                       [0-9]
IDENTIFIERS                 [a-zA-Z_][a-zA-Z0-9_]*

/* STRING_LITERALS */
S_CHAR                      [^\"\n\\]|{ESCAPE_SEQUENCE}
S_CHAR_SEQUENCE             {S_CHAR}+
STRING_LITERAL              \"({S_CHAR_SEQUENCE})?\"

/* CONSTANTS */
INTEGER_CONSTANT            [1-9][0-9]*|[0]+

ENUMERATION_CONSTANT        {IDENTIFIERS}

ESCAPE_SEQUENCE             "\\\'"|"\\\""|"\?"|"\\"|"\a"|"\b"|"\f"|"\n"|"\r"|"\t"|"\v"

C_CHAR                      [^\'\n\\]|{ESCAPE_SEQUENCE}
C_CHAR_SEQUENCE             ({C_CHAR})+
CHARACTER_CONSTANT          \'({C_CHAR_SEQUENCE})\'
        
DIGIT_SEQUENCE              [0-9]+
EXPONENT_PART               ([Ee]([+-]?)({DIGIT_SEQUENCE}))
FRACTION_PART               {DIGIT_SEQUENCE}\.|{DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}
FLOATING_CONSTANT           ({DIGIT_SEQUENCE}{EXPONENT_PART})|({FRACTION_PART}{EXPONENT_PART}?)
CONST                       {INTEGER_CONSTANT}|{CHARACTER_CONSTANT}|{FLOATING_CONSTANT}

/* PUNCTUATORS */
PUNCTUATORS1				"["|"]"|"("|")"|"{"|"}"|"."|"->"
PUNCTUATORS2				"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"
PUNCTUATORS3				"/"|"%"|"<<"|">>"|"<"|">"|"<="|">=" 
PUNCTUATORS4				"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"
PUNCTUATORS5				";"|"..."|"="|"*="|"/="|"%="|"+="|"-="
PUNCTUATORS6				"<<="|">>="|"&="|"^="|"|="|","|"#"
PUNCTUATORS				{PUNCTUATORS1}|{PUNCTUATORS2}|{PUNCTUATORS3}|{PUNCTUATORS4}|{PUNCTUATORS5}|{PUNCTUATORS6}


%%

{KEYWORDS}                  { return KEYWORDS; }
{IDENTIFIERS}               { return IDENTIFIERS; }
{STRING_LITERAL}            { return STRING_LITERAL; }
{INTEGER_CONSTANT}          { return INTEGER_CONSTANT; }
{FLOATING_CONSTANT}         { return FLOATING_CONSTANT; }
{CHARACTER_CONSTANT}        { return CHARACTER_CONSTANT; }
{PUNCTUATORS}               { return PUNCTUATORS; }

{ESCAPE_SEQUENCE}|" "                     

{SINGLE_LINE_COMMENT}		{ return SINGLE_LINE_COMMENT; }
{MULTI_LINE_COMMENT} 		{ return MULTI_LINE_COMMENT; }

%%


