/* Grp No: 34
   Names: Killada Gowtham Sai, Ankit Lalotra
   Roll No's: 19CS10040, 19CS30004
*/

#include <stdio.h>

extern char* yytext;

int main() {

	int token_val;
	while (token_val = yylex()) {

		switch (token_val) {

			// Case for all Keywords
			case KEYWORDS:
				printf("<KEYWORD, %d, %s>\n",token_val, yytext);
				break;

			// Case for all Identifiers
			case IDENTIFIERS: 
				printf("<IDENTIFIER, %d, %s>\n",token_val, yytext); 
				break;

			// Case for all Constants
			// Case for Integer constant
			case INTEGER_CONSTANT: 
				printf("<INTEGER CONSTANT, %d, %s>\n",token_val, yytext); 
				break;

			// Case for all string literals
			case STRING_LITERAL: 
				printf("<STRING LITERAL, %d, %s>\n",token_val, yytext); 
				break;

			// Case for Floating point constant
			case FLOATING_CONSTANT: 
				printf("<FLOAT CONSTANT, %d, %s>\n",token_val, yytext); 
				break;

			// Case for Character constant
			case CHARACTER_CONSTANT: 
				printf("<CHARACTER CONSTANT, %d, %s>\n",token_val, yytext); 
				break;

			// Case for all Punctuators
			case PUNCTUATORS: 
				printf("<PUNCTUATOR, %d, %s>\n",token_val, yytext); 
				break;

			// Case for all Comments
			// Case for Single line comments
			case SINGLE_LINE_COMMENT:
				printf("<SINGLE_LINE_COMMENT, %d, %s>\n",token_val, yytext);
				break;

			// Case for Multi line comments
			case MULTI_LINE_COMMENT:
				printf("<MULTI_LINE_COMMENT, %d, %s>\n",token_val, yytext);
				break;
			default: 
				printf("Wrong literal\n");
				break;
		}
	}
	
	return 0;
}

