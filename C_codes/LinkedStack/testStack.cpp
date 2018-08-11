#include <iostream>
#include <string.h>
#include "stackLL.cpp"
using namespace std;

int main()
{
	char trray[10] = {30,40,90,40,50,'a','b','c','d','e'};
	stack<char> test(10,trray);
	test.print();
	char dd =  test.pop();
	dd = test.pop();
	test.push('a');
	test.push('a');
	test.push('a');
	test.push('a');
	test.print();
	cout<<"\n-------------------------";
	/*for(int i=0;i<4;i++)
		cout<<test.pop();*/
	test.print();
}
