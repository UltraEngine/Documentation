# CreateStaticBuffer #
This function creates a static buffer from an existing block of memory.

## Syntax ##
- shared_ptr<[Buffer](CPP_Buffer.md)\> CreateStaticBuffer(const void* data, const uint64_t size)

### Parameters ###
|Name|Description|
|---|---|
|data|pointer to a block of allocated memory|
|size|size of the allocated memory block|

## Returns ###
Returns a new static buffer.

## Remarks ##
Caution should be exercised when using this command. The buffer cannot be resized and will not free the memory when the buffer is deleted. If the memory block is freed elsewhere while still in use in this buffer it may cause errors.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	//Create an object
	Vec3 v = Vec3(1, 2, 3);
	
	//Create static buffer
	auto buffer = CreateStaticBuffer(&v, 12);
	
	//Print out the contents
	Print(buffer->PeekFloat(0));
	Print(buffer->PeekFloat(4));
	Print(buffer->PeekFloat(8));
	
	return 0;
}
```
