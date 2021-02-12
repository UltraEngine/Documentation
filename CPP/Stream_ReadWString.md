# Stream::ReadWString #
This method reads a wide null-terminated string from the stream.

## Syntax ##
- [WString](WString.md) **ReadWString**()

## Returns ##
Returns a wide string value read from the file.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.txt";

	//Write a new file
	auto stream = WriteFile(path);
	if (stream == NULL)
	{
		Print("Failed to write file.");
		return 0;
	}

	stream->WriteWString("Hello, world!");
	stream->Close();

	stream = ReadFile(path);
	Print(stream->ReadWString());

	return 0;
}
```
