/*	Grp No: 34
	Name: Killada Gowtham Sai
	Roll No: 19CS10040
	Name: Ankit Lalotra
	Roll No: 19CS30004
	*/

#ifndef TRANSLATE
#define TRANSLATE
#include <bits/stdc++.h>

#define CHAR_SIZE          1
#define INT_SIZE           4
#define DOUBLE_SIZE        8
#define POINTER_SIZE       4

using namespace std;

extern char *yytext;
extern int yyparse();


/* Class Declarations */
class sym;
class quad;
class symtype;
class symtable;
class quadArray;

/* global variables */
extern quadArray q;
extern symtable * table;
extern sym * currentSymbol;
extern symtable * globalTable;


/* Defination of the type of symbol */
class symtype
{
	public:
	
	symtype(string type, symtype *ptr = NULL, int width = 1);
	string type;
	int width;
	symtype * ptr;
};

/* Defination of the struct of quad element */
class quad
{
	public:
		
	string op;
	string result;
	string arg1;
	string arg2;

	void print();
	quad(string result, string arg1, string op = "EQUAL", string arg2 = "");
	quad(string result, int arg1, string op = "EQUAL", string arg2 = "");
	quad(string result, float arg1, string op = "EQUAL", string arg2 = "");
};

/* Defination of the quad array type */
class quadArray
{
	public:
	
	vector<quad> Array;
	void print();
};

/* Defination of structure of each element of the symbol table */
class sym
{
	public:
		
	string name;
	symtype * type;
	string initial_value;
	string category;
	int size;
	int offset;
	symtable * nested;

	sym(string name, string t = "INTEGER", symtype *ptr = NULL, int width = 0);
	sym* update(symtype *t);
	sym* link_to_symbolTable(symtable *t);
};

/* Class defination for the Symbol Table */
class symtable
{
	public:
		
	string name;
	int count;
	list<sym> table;
	symtable * parent;
	map<string, int> ar;
	symtable(string name = "NULL");
	sym* lookup(string name);
	void print();
	void update();
};

/* Class defination for the Statements */
struct statement
{
	list<int> nextlist;
};

/* Attributes of the array type element */
struct Array
{
	string cat;
	sym * loc;
	sym * Array;
	symtype * type;
};

/* Defination of the expression type */
struct expr
{
	string type;

	/* Valid for non-bool type */
	sym * loc;

	/* Valid for bool type */
	list<int> truelist;
	list<int> falselist;

	/* Valid for statement expression */
	list<int> nextlist;
};

sym* gentemp(symtype *t, string init = "");

/* Overloaded emit function used by the parser */

/* Global functions required for the translator */
void emit(string op, string result, string arg1 = "", string arg2 = "");
void emit(string op, string result, int arg1, string arg2 = "");
void emit(string op, string result, float arg1, string arg2 = "");

/* Backpatching and related functions */
void backpatch(list<int> lst, int i);
list<int> makelist(int i);
list<int> merge(list<int> &lst1, list<int> &lst2);

/* Other helper functions required for TAC generation */
sym* conv(sym *, string);
bool typecheck(sym* &s1, sym* &s2);
bool typecheck(symtype *t1, symtype *t2);

expr* convertInt2Bool(expr*);
expr* convertBool2Int(expr*);

void changeTable(symtable *newtable);
int nextinstr();

/* Other helper function for debugging and printing */
int size_type(symtype*);
string print_type(symtype*);

#endif

