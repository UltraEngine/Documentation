# Buffer::PeekByte #
This method returns a single byte from the memory buffer.

## Syntax ##
- unsigned char **PeekByte**(const uint64_t pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a byte value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.

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
