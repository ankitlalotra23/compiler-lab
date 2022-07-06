// typecasting and pointers
void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
	return;
}

int division(float a, float b)
{
	int quotient;
	quotient = a/b;
	return quotient;
}

int main()
{
	int q = 0, r = 0;
	float x = 2.5;
	q = division(x, 1.2);
	r = 10;
	swap(&q, &r);
	return;
}

