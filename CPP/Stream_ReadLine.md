# Stream::ReadLine #

This method reads a line of text from the stream.

## Syntax ##

- [String](String.md) **ReadLine**()

## Returns ##

Returns a line of text from the stream.

## Example

```c++
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