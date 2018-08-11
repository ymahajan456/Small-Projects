/* 
* Title : Stack_LL_array.cpp (Stack using Linked List)
* Author : Yogesh Mahajan			---(y.mahajan456@gmail.com)
* Description : Implementation of stack using Linked Arrays
*/

#include <iostream>
#include <string.h>
using namespace std;

template <class T>
struct pile
{
	T* current_pile;
	struct pile *next_pile;
	int pile_size;
};

template <class T>
class stack
{
	struct pile<T>* top_pile;
	int top;
	int size;
	
	
	void print(T* array, int len)
	{
		for(int i = len; i>0; i--)
		{
			cout<<"\n"<<array[i-1];
		}
		cout<<endl;
	}
	
	
	public:
	void copy_pile(T* destination, int len, T* source)
	{
		for(int i=0; i<len; i++)
			destination[i]=source[i];
	}
		
	stack(int s, T* input)
	{
		top_pile = new pile<T>;
		top_pile->current_pile = new T[s];
		copy_pile(top_pile->current_pile,s,input);
		top_pile->next_pile = NULL;
		top_pile->pile_size = s;
		size = s;
		top = s-1;								//zero indexed vector
	}
		
	stack(int s)
	{
		top_pile = new pile<T>;
		top_pile->current_pile = new T[s];
		for(int i=0; i<s; i++)
		{
			top_pile->current_pile[i] = 0;
		}
		top_pile->next_pile = NULL;
		top_pile->pile_size = s;
		size = s;
		top = -1;
	}
		
	stack()
	{
		top_pile = new pile<T>;
		top_pile->current_pile = new T[8];
		for(int i=0; i<8; i++)
		{
			top_pile->current_pile[i] = 0;
		}
		top_pile->next_pile = NULL;
		top_pile->pile_size = 8;
		size = 8;
		top = -1;
	}
		
	bool push(T data)
	{
		if(top+1 == size)
		{
			struct pile<T>* new_pile;
			new_pile = new pile<T>;
			new_pile->pile_size = size;
			new_pile->current_pile = new T[size];
			new_pile->next_pile = top_pile;
			top_pile = new_pile;
			size*= 2;
		}
		{
			top++;
			top_pile->current_pile[top + top_pile->pile_size - size] = data;
			return true;
		}
	}
	
	T *pop()
	{
		T data_tmp;
		if(top == -1)
		{
			//cout<<"EmptyStack";
			return nullptr;
		}
		data_tmp = top_pile->current_pile[top + top_pile->pile_size - size];
		top--;
		if(top < (size-top_pile->pile_size))
		{
			size -= top_pile->pile_size;
			delete[] top_pile->current_pile;
			struct pile<T>* tmp_pile_pointer = top_pile->next_pile;
			delete top_pile;
			top_pile = tmp_pile_pointer;
		}
		return &data_tmp;
	}
	
	T *peak()
	{
		T data_tmp;
		if(top == -1)
		{
			cout<<"EmptyStack";
			return nullptr;
		}
		data_tmp = top_pile->current_pile[top + top_pile->pile_size - size];
		return &data_tmp;
	}
	
	bool is_empty()
	{
		if(top == -1)
			return true;
			
		return false;
	}
	
	void empty()
	{
		while(!is_empty())
		{
			pop();
		}
	}
	
	void print()
	{
		cout<<"\nSize: "<<size<<"       Top: "<<top<<"\nStack:";
		struct pile<T>* tmp_pile_pointer_loop;
		struct pile<T>* way_to_go_back = top_pile;
		while(top_pile != NULL)
		{
			tmp_pile_pointer_loop = top_pile->next_pile;
			print(top_pile->current_pile,top_pile->pile_size);
			cout<<"\n";
			top_pile = tmp_pile_pointer_loop;
		}
		top_pile = way_to_go_back;
	}
	
	~stack()
	{
		struct pile<T>* tmp_pile_pointer;
		while(top_pile != NULL)
		{
			tmp_pile_pointer = top_pile->next_pile;
			delete[] top_pile->current_pile;
			delete top_pile;
			top_pile = tmp_pile_pointer;
		}
	}
};


