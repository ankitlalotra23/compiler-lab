// nested If-Else and recursive functions  
int euclidian_GCD(int a, int b) 
{ 
    if (a == 0) 
        return b; 
    return euclidian_GCD(b % a, a); 
} 

int main()  
{  
    int a, b, g;
    int flag = 2;
    if(flag == 0)
    {
    	a = 200;
    	b = 50;
    }
    else
    {
    	a = 40;
    	if(flag == 1)
    		b = 5;
    	else
    		b = 8;
    }
    g = euclidian_GCD(a, b);
    return 0;  
}

