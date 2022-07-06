/*	Grp No: 34
	Name: Killada Gowtham Sai
	Roll No: 19CS10040
	Name: Ankit Lalotra
	Roll No: 19CS30004
*/

#include "myl.h"

#define BUFF 20
#define STDIN_FILENO 0
#define PRECISION_DIG 8



int printStr(char *str){
    int i = 0, bytes;
    while(str[i] != '\0'){
        i++;
    }
    
    bytes = i+1;
    
    __asm__ __volatile__ (
        "movl $1, %%eax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        :"S"(str), "d"(bytes)
    );
    
    return bytes;
}



int readInt(int *n){
    char buff[BUFF];
    int l, is_negative_number = 0;
    
    __asm__ __volatile__ (
        "movl $0, %%eax;"
        "movq $0, %%rdi;"
        "syscall;"
        : "=a"(l)
        :"S"(buff), "d"(BUFF)
    );
    
    *n = 0;
    int i = 0;
    if(buff[i] == '-'){
        is_negative_number = 1;
        i++;
    }
    
    int buff_reader[104];
    for(int j = 0; j < 104; j++){
        buff_reader[0] = 0;
        l += buff_reader[0];
    }
    
    while(i < l-1){
        *n *= 10;
        if(buff[i] < '0' || buff[i] > '9'){
            return ERR;
        }
        *n += buff[i] - '0';
        i++;
    }
    
    if(is_negative_number){
        *n = (*n)*(-1);
    }
    
    if(l <= 0){
        return ERR;
    }
    else{
        return OK;
    }
}



int printInt(int n){
    char buff[BUFF], zero = '0';
    int i = 0, j, k, bytes;
    int r;
    
    if(n == 0) buff[i++] = zero;
    else{
        if(n < 0){
            buff[i++] = '-';
            n = -n;
        }
        while(n){
            int dig = n%10;
            buff[i++] = (char)(zero + dig);
            n = n/10;
        }
        
        if(buff[0] == '-') j = 1;
        else j = 0;
        
        k = i - 1;
        while(j < k){
            char temp = buff[j];
            buff[j++] = buff[k];
            buff[k--] = temp;
        }
    }
    
    bytes = i;
    
    __asm__ __volatile__( 
        "movl $1, %%eax \n\t" 
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :"=a"(r)
        :"S"(buff),"d"(bytes)
    );
    
    if(r < 0){
        return ERR;
    }
    else{
        return r;
    }
}



int readFlt(float *f){
    int i = 0, is_fraction = 0;
    char ch = 'a';
    int sign = 1, val = 0;
    float fraction = 0.0;
    int point = 0;
    float fmp = 0.1;
    
    int buff_reader[104];
    for(int j = 0; j < 104; j++){
        buff_reader[0] = 0;
        i += buff_reader[0];
    }
    
    while(1){
        __asm__ __volatile__ ("syscall"::"a"(0), "D"(0), "S"(&ch), "d"(1));
        
        if(ch == ' ' || ch == '\t' || ch == '\n'){
            break;
        }
        else if(ch == '.'){
            is_fraction = 1;
            point++;
        }
        else if(i == 0 && ch == '-'){
            sign = -1;
        }
        else{
            if(ch < '0' || ch > '9'){
                return ERR;
            }
            else{
                if(!is_fraction){
                    val *= 10;
                    val += (int)(ch - '0');
                }
                else if(is_fraction && point == 1){
                    fraction = fraction + fmp*((int)(ch - '0'));
                    fmp *= 0.1;
                }
                else{
                    return ERR;
                }
            }
        }
        i += 1;
    }
    
    *f = (((float)val + fraction) * (float)sign);
    return OK;
}



int printFlt(float f){
    char buff[BUFF];
    char zero[] = "0.00000000";
    char neg_sign[] = "-";
    char point[] = ".";
    int l = 0;
    int neg = 0;
    
    if(f == 0){
        printStr(zero);
        return 10;
    }
    else if(f < 0){
        printStr(neg_sign);
        f *= -1;
        neg = 1;
    }
    
    int int_part = (int)f;
    float frac_part = f - int_part;
    int int_l = printInt(int_part);
    
    if(int_l <= 0){
        return ERR;
    }
    
    printStr(point);
    
    int buff_reader[104];
    for(int i = 0; i < 104; i++){
        buff_reader[0] = 0;
        l += buff_reader[0];
    }
    
    for(;l < PRECISION_DIG;){
        frac_part *= 10;
        int dig = (int)frac_part;
        buff[l++] = dig + '0';
        frac_part -= dig;
    }
    
    buff[l] = '\0';
    printStr(buff);
    
    return neg + int_l + 1 + PRECISION_DIG;
}

