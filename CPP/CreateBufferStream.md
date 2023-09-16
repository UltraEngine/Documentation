# CreateBufferStream

This function creates a new BufferStream object that allows read and writing to a block of memory as if it were a file.

## Syntax
- shared_ptr<[BufferStream](BufferStream.md)\> **CreateBufferStream**(shared_ptr<[Buffer](Buffer.md)\> data = NULL, const [WString](WString.md)& path = "")

| Parameter | Description |
| --- | --- |
| data | can be used to specify an existing data buffer for the stream to use |
| path | sets the Stream path member to simulate a file |

## Returns
Returns a new BufferStream object.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a memory buffer and fill in some data
	auto buffer = CreateBuffer(10 * sizeof(int));
	for (int n = 0; n < 10; ++n)
	{
		buffer->PokeInt(n * sizeof(int), n);
	}

	//Create a buffer stream
	auto stream = CreateBufferStream(buffer);

	//Read from the memory buffer as if it were a file
	while (!stream->EoF())
	{
		Print(stream->ReadInt());
	}

	return 0;
}
```
