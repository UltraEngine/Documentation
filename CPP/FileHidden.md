# FileHidden #
This function returns the hide state of the specified file path.

## Syntax ##
- bool **FileHidden**(const [WString](WString.md)& path)

## Returns ##
Returns true of the file exists and is hidden, otherwise false is returned.

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