# DeleteDir

This function deletes a folder in the file system.

## Syntax

- bool **DeleteDir**(const [WString](WString)& path, const bool recursive = false)

| Parameter | Description |
| --- | --- |
| path | folder location to delete |
| recursive | if set to true, all files and subfolders will be deleted |

## Returns

Returns true if the folder was successfully deleted.

## Remarks

If any files or subfolders exist within the specified folder, it will not be deleted unless the recursive option is set to true. **Use this option with caution.**

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = GetPath(PATH_DOCUMENTS) + "/Temp Folder";

	CreateDir(path);
	if (FileType(path) != 2)
	{
		Print("Failed to write folder.");
		return 0;
	}

	Print("Folder created.");

	OpenDir(ExtractDir(path));
	Sleep(3000);

	if (DeleteDir(path))
	{
		Print("Folder deleted.");
	}
	else
	{
		Print("Failed to delete folder.");
	}

	return 0;
}
```
