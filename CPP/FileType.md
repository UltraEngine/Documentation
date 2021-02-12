# FileType #
This function detects the type of a specified file path.

## Syntax ##
- int **FileType**(const [WString](WString.md)& path)

| Parameter | Description |
| --- | --- |
| path | file path to read |

## Returns ##
Returns 1 if the specified path is a file, 2 if it is a folder, or 0 if it does not exist.

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

    int type = FileTime(path);
    Print("File type: " + String(type));

    return 0;
}
```
