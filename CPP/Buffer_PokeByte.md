# Buffer::PokeByte
This method inserts a single byte into a memory buffer.

## Syntax
- void **PokeByte**(const uint64_t pos, const unsigned char b)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| b | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(20 * sizeof(char));
	
	//Poke data to the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(char); ++n)
	{
		buffer->PokeByte(n, n + 1);
	}

	//Peek and display data from the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(char); ++n)
	{
		Print(buffer->PeekByte(n));
	}

	return 0;
}
```
