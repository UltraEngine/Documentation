# Buffer::PokeShort
This method inserts a single short integer into a memory buffer.

## Syntax
- void **PokeShort**(const uint64_t pos, const unsigned short i)

| Parameter | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **i** | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(20 * sizeof(short));
	
	//Poke data to the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(short); ++n)
	{
		buffer->PokeShort(n * sizeof(short), n + 1);
	}

	//Peek and display data from the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(short); ++n)
	{
		Print(buffer->PeekShort(n * sizeof(short)));
	}

	return 0;
}
```
