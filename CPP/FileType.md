# FileType

This function detects the type of a specified file path.

## Syntax

- int **FileType**(const [WString](WString.md)& path, const bool packages = true)

| Parameter | Description |
| --- | --- |
| path | file path to read |
| packages | if true then any loaded packages will be checked after the file system |

## Returns

Returns 1 if the specified path is a file, 2 if it is a folder, or 0 if it does not exist.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = CurrentDir();

	auto dir = LoadDir(path);
	if (path == "") path = ".";
	for (auto file : dir)
	{
		Print("Name: " + file);

		if (path != "") file = path + "/" + file;

		Print("Type: " + String(FileType(file)));
		Print("Time: " + String(FileTime(file)));
		Print("Size: " + String(FileSize(file)));
		Print("Hidden: " + String(FileHidden(file)));

		Print("");
	}
	return 0;
}
```
