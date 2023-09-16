# Stream::Read

This method reads a block of memory from a stream. This can be more efficient than reading one value at a time, and supports additional data types there is not an explicit read method for.

## Syntax

- uint64_t **Read**(shared_ptr<[Buffer](Buffer.md)> data, const uint64_t offset, const uint64_t size)
- uint64_t **Read**(const void* data, const uint64_t size)

| Parameter | Description |
| --- | --- |
| offset | offset in bytes from memory buffer beginning |
| data | buffer or pointer to read from |
| size | number of bytes to read |

## Returns

Returns the number of bytes that were read from the stream.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = GetPath(PATH_DOCUMENTS) + "/temp.bin";

	//Open a stream with read and write permissions
	DeleteFile(path);
	auto stream = OpenFile(path);
	if (stream == NULL)
	{
		Print("Failed to write file.");
		return 0;
	}

	//Initialize data
	std::array<int, 10> data;
	for (int n = 0; n < 10; ++n)
	{
		data[n] = 100 + n;
	}

	//Write data to the stream
	stream->Write(&data[0], sizeof(data[0]) * data.size());

	//Change the stream positio
	stream->Seek(0);

	//Read back the data	
	stream->Read(&data[0], sizeof(data[0]) * data.size());

	for (int n = 0; n < 10; ++n)
	{
		Print(data[n]);
	}

	return 0;
}
```
