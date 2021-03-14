# Buffer::PeekShort
This method returns a short integer from the memory buffer.

## Syntax
- unsigned short **PeekShort**(const uint64_t pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns
Returns a short integer value.

## Remarks
A runtime error will occur if the read range lies outside of the buffer extents.

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
