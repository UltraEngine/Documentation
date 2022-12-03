# ExtractExt #

This function returns the extension part of a file path.

## Syntax ##

- [WString](WString) **ExtractExt**(const [WString](WString)& path)

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns ##

Returns the extension part of the specified path.

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = "C:/Windows/explorer.exe";

	Print("Full path: " + path);
	Print("File name: " + StripDir(path));
	Print("File directory: " + ExtractDir(path));
	Print("File extension: " + ExtractExt(path));	
	Print("File name without extension: " + StripAll(path));
	Print("File path without extension: " + StripExt(path));
	return 0;
}
```
