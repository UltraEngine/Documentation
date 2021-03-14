# Buffer::PokeInt
This method inserts a single integer into a memory buffer.

## Syntax
- void **PokeInt**(const uint64_t pos, const int i)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| i | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(20 * sizeof(int));
	
	//Poke data to the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(int); ++n)
	{
		buffer->PokeInt(n * sizeof(int), n + 1);
	}

	//Peek and display data from the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(int); ++n)
	{
		Print(buffer->PeekInt(n * sizeof(int)));
	}

	return 0;
}
```
