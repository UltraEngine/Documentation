# RenameFile
This function changes the name of an existing file.

## Syntax 
- bool **RenameFile**(const WString& src, const WString& dest)

| Parameter | Description |
|---|---|
| src | existing file path |
| dest | new file name |

## Returns
Returns true if the file was successfully renamed, otherwise false is returned.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = GetPath(PATH_DOCUMENTS) + "/temp.txt";

    //Create a new file
    if (!CreateFile(path))
    {
        Print("Failed to write file.");
        return 0;
    }

    //Rename the file
    auto dst = ExtractDir(path) + "/temp2.txt";
    DeleteFile(dst);
    if (!RenameFile(path, dst))
    {
        Print("Failed to rename file.");
    }

    OpenDir(dst);

    return 0;
}
```
