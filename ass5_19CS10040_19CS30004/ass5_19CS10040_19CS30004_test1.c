//  arrays, loops and nested loops
int l = 0;

int main()
{
	int i, j, n;
	int sum = 0;
	char x = 'x';
	int p[5];
	int dp[5][5];
	n = 10;
	j = 100;
	i = 0;

	while(i < 10)
	{
		i++;
		++j;
		p[i] = i*j;
	}

	do
	{
		sum = sum + p[i];
	}while(i < n);

	for(i = 0; i < n; i++)
	{
		for(j = 0; j < n; j++)
			dp[i][j] = sum + i*j;
	}
	
	return 0;
}

