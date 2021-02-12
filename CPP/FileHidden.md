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
	WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.txt";

	//Create a new file
	if (!CreateFile(path))
	{
		Print("Failed ti write file.");
		return 0;
	}

	bool hidden = FileHidden(path);
	Print("File hidden: " + String(hidden));

	return 0;
}
```
