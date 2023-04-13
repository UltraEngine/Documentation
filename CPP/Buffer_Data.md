# Buffer::Data
This method retrieves a pointer to the buffer's allocated memory block.

## Syntax
- char* **Data**()

## Returns
Returns a pointer to the allocated block of memory, or returns NULL is no memory is allocated.

## Remarks
This method exposes low-level memory allocations. If possible it is better to use the [Buffer::Copy](Buffer_Copy.md) method, which has more built-in error checking.

The pointer this method returns may become invalid if the buffer is resized. To prevent errors, this method should be called each time the pointer is used. Do not store the returned pointer in a variable to be reused.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(16);
	buffer->PokeInt(0, 1);
	buffer->PokeInt(4, 2);
	buffer->PokeInt(8, 3);
	buffer->PokeInt(12, 4);

	//Copy the buffer contents to an array
	array<int, 4> arr = {};
	memcpy(arr.data(), buffer->Data(), buffer->GetSize());

	//Display the results
	for (int i : arr)
	{
		Print(i);
	}

	return 0;
}
```
