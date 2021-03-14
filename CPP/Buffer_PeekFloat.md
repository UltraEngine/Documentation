# Buffer::PeekFloat
This method returns a float value from the memory buffer.

## Syntax
- float **PeekFloat**(const uint64_t pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns
Returns a float value.

## Remarks
A runtime error will occur if the read range lies outside of the buffer extents.

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
