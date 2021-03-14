# Buffer::GetSize

This method retrieves the size of the allocated memory block.

## Syntax

uint64_t **GetSize**()

## Returns

Returns the size of the allocated memory block, in bytes.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(10);

	//Resize the buffer
	buffer->Resize(20);

	//Get the buffer size
	Print(buffer->GetSize());

	return 0;
}
```
