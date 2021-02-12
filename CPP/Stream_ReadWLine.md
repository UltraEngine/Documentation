# Stream::ReadWLine #

This method reads line of wide text from the stream.

## Syntax ##

- [WString](WString.md) **ReadWLine**()

## Returns ##

Returns a line of wide text from the stream.
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

	stream->WriteWLine("Hello, world!");
	stream->Close();

	stream = ReadFile(path);
	Print(stream->ReadWLine());

	return 0;
}
```
