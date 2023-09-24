# LoadBuffer

This function loads a buffer from a file.

## Syntax

- shared_ptr<[Buffer](Buffer.md)\> **LoadBuffer**(const [WString](WString.md)& path, const [LoadFlags](Constants.md) flags = LOAD_DEFAULT)

| Parameter | Description |
| ----- | ----- |
| path | file name to load |
| flags | optional load settings |

## Returns

Returns the loaded buffer if successful, otherwise NULL is returned.

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

	//Save the buffer
	WString path = GetPath(PATH_DOCUMENTS) + "/temp.bin";
	if (!buffer->Save(path)) RuntimeError("Failed to save buffer.");

	//Load the buffer
	buffer = LoadBuffer(path);
	if (buffer == NULL) RuntimeError("Failed to load buffer.");
	DeleteFile(path);

	Assert(buffer->GetSize() == 16);
	Print(buffer->PeekInt(0));
	Print(buffer->PeekInt(4));
	Print(buffer->PeekInt(8));
	Print(buffer->PeekInt(12));

	return 0;
}
```
