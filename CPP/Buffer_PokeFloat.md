# Buffer::PokeFloat
This method inserts a float value into the memory buffer.

## Syntax
- void **PokeFloat**(const uint64_t pos, const float f)

| Parameter | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **f** | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(20 * sizeof(float));
	
	//Poke data to the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(float); ++n)
	{
		buffer->PokeFloat(n * sizeof(float), n + 1);
	}

	//Peek and display data from the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(float); ++n)
	{
		Print(buffer->PeekFloat(n * sizeof(float)));
	}

	return 0;
}
```
