# LoadDir

This function loads the contents of a directory and returns an array of files.

## Syntax

- vector<[WString](WString.md)> **LoadDir**(const [WString](WString.md)& path, const bool packages = true)

| Parameter | Description |
|---|---|
| path | file path to load |
| packages | if true any loaded packages will be checked for the specified folder after the file system |

## Returns

Returns an array of file names found within the directory. The array will be empty if the specified path contains no files, or if the folder contains no files.
 
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
