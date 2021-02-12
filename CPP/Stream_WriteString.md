# Stream::WriteString #
This method writes a string to the stream at the current position.

## Syntax ##
- void **WriteString**(const [String](String.md)& s, const bool terminate = true)

### Parameters ###
| Name | Description |
|---|---|
| s | string to write |
| terminate | if true an extra byte with a value of zero will be written at the end of the string |

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