# CreateFile

This function creates a new file on the user's hard drive. The new file will initially be empty. If a file exists at this location it will be overwritten.

## Syntax
- bool **CreateFile**(const [WString](WString.md) path)

| Parameter | Description |
|---|---|
| path | full or relative path to the new file |

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
        Print("Failed to write file.");
        return 0;
    }

    OpenDir(path);

    return 0;
}
```