# Stream::WriteWLine #
This method writes a line of wide text to the stream at the current position.

## Syntax ##
- void **WriteWLine**(const [WString](WString.md)& s)

| Parameter | Description |
| --- | --- |
| s | value to write |

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
