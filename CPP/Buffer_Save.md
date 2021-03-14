# Buffer::Save

Thie method saves the buffer's contents to a file.

## Syntax
- bool **Save**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | file name to save |

## Returns

Returns true if the file is saved successfully, otherwise false is returned.

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
	WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.bin";
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
