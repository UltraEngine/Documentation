# Stream::ReadString #
This method reads a string from the stream at the current position. The string will be terminated by either the null character, the end of the file, or the maxomum string length, whichever comes first.

## Syntax ##
- [String](String.md) **ReadString**(const int maxlength = 0)

| Parameter | Description |
|---|---|
| maxlength | if greater than zero, this is maximum length of the string that will be read |

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

	stream->WriteString("Hello, world!");
	stream->Close();

	stream = ReadFile(path);
	Print(stream->ReadString());

	return 0;
}
```