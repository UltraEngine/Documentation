# FileTime

This function returns the last time a file at the specified path was created or modified.

## Syntax

- uint64_t **FileTime**(const [WString](WString.md)& path, const bool packages = true)

| Parameter | Description |
| --- | --- |
| path | file path to read |
| packages | if true loaded packages will be checked after the file system |

## Returns

Returns the file time, in units of 100 nanosecond intervals that have elapsed since since 12:00 A.M. January 1, 1601 Coordinated Universal Time (UTC). If the file does not exist then zero is returned.

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
