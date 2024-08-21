# ReadFile #
This function loads a file from a path and returns a stream.

## Syntax ##
- shared_ptr<[Stream](Stream.md)\> **ReadFile**(const [WString](WString.md)& path, const bool packages = true)

### Parameters ###
|  Name | Descriptio   |
|--|--|
| **path** | file name or URL to load |
| **packages** | set to true if packages should be read |

## Returns ##
Returns a new [Stream](Stream.md) object If the file was successfully read, otherwise NULL is returned.

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
