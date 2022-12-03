# DeleteFile

This function deletes a file in the file system.

## Syntax

- bool **DeleteFile**(const [WString](WString)& path)

| Parameter | Description |
| --- | --- |
| path | location of file to delete |

## Returns

Returns true if the file was successfully deleted.

## Remarks

It is not possible to restore deleted files. Use this feature with caution.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = GetPath(PATH_DOCUMENTS) + "/temp.bin";

	CreateFile(path);
	if (!FileType(path) != 1)
	{
		Print("Failed to write file.");
		return 0;
	}

	Print("File created.");

	OpenDir(path);
	Sleep(3000);

	if (DeleteFile(path))
	{
		Print("File deleted.");
	}
	else
	{
		Print("Failed to delete file.");
	}

	return 0;
}
```
