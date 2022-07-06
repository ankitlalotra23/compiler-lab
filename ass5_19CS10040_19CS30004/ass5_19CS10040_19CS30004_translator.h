/* Grp No: 34
   Name: Killada Gowtham Sai
   Roll No: 19CS10040
   Name: Ankit Lalotra
   Roll No: 19CS30004
*/

#ifndef _TRANSLATE_H
#define _TRANSLATE_H

#include <bits/stdc++.h>

extern  char* yytext;
extern  int yyparse();

using namespace std;


/* Class Declarations */
class sym;
class quad;
class label;
class symtable;
class basicType;
class quadArray;
class symboltype;
class Expression;

typedef sym s;
typedef symboltype symtyp;
typedef Expression* Exps;


/* Global Variables */
extern symtable* ST;
extern symtable* globalST;
extern symtable* parST;
extern s* currSymbolPtr;
extern quadArray Q;
extern basicType bt;
extern long long int table_count;
extern bool debug_on;
extern string loop_name;
extern vector<label>label_table;


/* Defination of structure of each element of the symbol table */
class sym 
{
	public:
        string name;
        symboltype *type;
        int size;
        int offset;
        symtable* nested;
        string val;
          
        sym (string , string t="int", symboltype* ptr = NULL, int width = 0);
        sym* update(symboltype*);
};

/* Defination of the label symbol */
class label                                                  
{
    public:
        string name;                                   
        int addr;                                    
        list<int> nextlist;                               

        label(string _name, int _addr = -1);      
};

/* Defination of the type of symbol */
class symboltype 
{                                              
    public:
        string type;                                                  
        int width;                                     
        symboltype* arrtype;                        
        
        symboltype(string , symboltype* ptr = NULL, int width = 1);   
};

/* Class defination for the Symbol Table */
class symtable 
{                           
    public:
        string name;                                 
        int count;                                       
        list<sym> table;                                                           
        symtable* parent;                                                           
        
        symtable (string name="NULL");                                    
        s* lookup (string);                                                 
        void print();                                                        
        void update();                                                                   
};

/* Defination of the struct of quad element */
class quad 
{                                                            
    public:
        string res;                                                     
        string op;                                              
        string arg1;                                                           
        string arg2;                                                                         

	    // Print the Quad 
        void print();	
        void type1();                                                                  
        void type2();                                          

        // Constructors 							
        quad (string , string , string op = "=", string arg2 = "");			
        quad (string , int , string op = "=", string arg2 = "");				
        quad (string , float , string op = "=", string arg2 = "");			
};

/* Defination of the quad array type */
class quadArray 
{                                                                     
    public:
        vector<quad> Array;                                    
        void print();                                                               
};

/* Defination of the basic type */
class basicType 
{                                                                      
    public:
        vector<string> type;                                
        vector<int> size;                          
        void addType(string ,int );
};

/* Defination of the expression type */
struct Expression {
    s* loc;                                                              
    string type;                                                                   
    list<int> truelist;                                                               
    list<int> falselist;                                                                
    list<int> nextlist;                                     
};

/* Attributes of the array type element */
struct Array {
    string atype;                                                               
    s* loc;                                                                                  
    s* Array;                                    
    symboltype* type;                                                       
};

struct Statement {
    list<int> nextlist;                            
};

/* Overloaded emit function used by the parser */
void emit(string , string , string arg1="", string arg2 = "");  
void emit(string , string , int, string arg2 = "");		  
void emit(string , string , float , string arg2 = "");   

/*
  GENTEMP
  -------
  generates a temporary variable and insert it in the current Symbole table 
 
  Parameter
  ---------
  symbol type * : pointer to the 
                  class of symbol type
  init : initial value of the structure
 
  Return
  ------
  Pointer to the newly created symbol table entry
 */
s* gentemp (symboltype* , string init = "");

/* Backpatching and related functions */
void backpatch (list <int> , int );                                               
list<int> makelist (int );                                               
list<int> merge (list<int> &l1, list <int> &l2);                   

/* Other helper functions required for TAC generation */
label* find_label(string name);
// Type checking and Type conversion functions  
string convertIntToString(int);                                              
string convertFloatToString(float);                                                  
Exps convertIntToBool(Exps);                                                                  
Exps convertBoolToInt(Exps);                                                 

s* convertType(sym*, string);                                          
int computeSize (symboltype *);                                               
void changeTable (symtable* );                                   
bool compareSymbolType(sym* &s1, sym* &s2);                                        
bool compareSymbolType(symboltype*, symboltype*);                                         

int nextinstr();                                                              

/* Other helper function for debugging and printing */
string printType(symboltype *);                                                
void generateSpaces(int);

#endif

