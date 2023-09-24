# Buffer::Copy

This method copies the contents of this buffer to another one.

## Syntax

- void **Copy**(const uint64_t srcoffset, shared_ptr<[Buffer](Buffer.md)> dst, const uint64_t dstoffset, const uint64_t size)

| Parameter | Description |
| ----- | ----- |
| srcoffset | offset for the source buffer data, in bytes |
| dst | destination buffer |
| dstoffset | offset for the destination buffer data, in bytes | 
| size | number of bytes to copy |

## Remarks

A runtime error will occur if the source or destination range lies outside of the buffer extents.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create two buffers
	array<int, 10> arr = { 0,1,2,3,4,5,6,7,8,9 };
	auto buffer1 = CreateStaticBuffer(arr.data(), arr.size() * sizeof(int));
	auto buffer2 = CreateBuffer(4 * sizeof(int));

	//Copy part of the buffer contents
	buffer1->Copy(3 * sizeof(int), buffer2, 0, buffer2->GetSize());

	//DIsplay the copied contents
	for (int n = 0; n < 4; ++n)
	{
		Print(buffer2->PeekInt(n * sizeof(int)));
	}

	return 0;
}
```
