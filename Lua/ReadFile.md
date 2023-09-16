# ReadFile

This function loads a file from a path and returns a stream.

## Syntax

- [Stream](Stream.md) **ReadFile**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path, number flags = LOAD_DEFAULT)

| Parameter | Descriptio   |
|--|--|
| path | file name or URL to load |
| flags | optional load settings |

## Returns

Returns a new [Stream](Stream.md) object If the file was successfully read, otherwise `nil` is returned.

## Example

```lua
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = GetPath(PATH_DOCUMENTS) + "/temp.txt";

	//Write a new file
	auto stream = WriteFile(path);
	if (stream == NULL)
	{
		Print("Failed to write file.");
		return 0;
	}

	stream->WriteLine("Hello, world!");
	stream->Close();

	stream = ReadFile(path);
	Print(stream->ReadLine());

	return 0;
}
```
