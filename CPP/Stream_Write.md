# Stream::Write

This method writes a block of memory to the stream. This can be more efficient than writing one value at a time, and supports additional data types there is not an explicit write method for.

## Syntax

- uint64_t **Write**(shared_ptr<[Buffer](Buffer.md)> data, const uint64_t offset, const uint64_t size)
- uint64_t **Write**(const void* data, const uint64_t size)

### Parameters

| Name | Description |
| --- | --- |
| data | buffer or pointer to read from |
| offset | offset in bytes from memory buffer beginning |
| size | number of bytes to write |

## Returns

Returns the number of bytes that were written to the stream.

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
