# StripExt #
This function removes the file extension part from a file path and returns the result.

## Syntax ##
- [WString](WString) **StripExt**(const [WString](WString)& path)

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns ##
Returns the file path with the extension removed.

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
