/******************************************************************************
	Filename: SHA256.h
******************************************************************************/

#ifndef _SHA_256_H_
#define _SHA_256_H_

// Header Files //
#include <stddef.h>
#include <memory.h>
#include <string.h>
#include <stdio.h>
#include <iostream>
using namespace std;

#define SHA256_BLOCK_SIZE 32

typedef unsigned int uint;

struct HexCharStruct
{
  unsigned char c;
  HexCharStruct(unsigned char _c) : c(_c) { }
};

inline std::ostream& operator<<(std::ostream& o, const HexCharStruct& hs)
{
  return (o << std::hex << (int)hs.c);
}

inline HexCharStruct hex(unsigned char _c)
{
  return HexCharStruct(_c);
}

void SHA256_transform(uint *state, unsigned char data[]);
void SHA256(char* messsage, int msglen, unsigned char* hash);
int test_SHA256();

#endif