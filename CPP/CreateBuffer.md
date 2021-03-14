# CreateBuffer

This function creates a new memory buffer object.

## Syntax

- shared_ptr<[Buffer](Buffer.md)\> CreateBuffer(const uint64_t size)

| Parameter | Description |
| ----- | ----- |
| **size** | size of the allocated memory block |

## Returns

If the memory is allocated successfully a new buffer object is returned, otherwise NULL is returned.

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
