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
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.txt";

    //Create a new file
    auto stream = WriteFile(path);
    if (stream == NULL)
    {
        Print("Failed ti write file.");
        return 0;
    }
    stream->Close();

    //Rename the file
    if (!RenameFile(path, ExtractDir(path) + "/temp2.txt"))
    {
        Print("Failed to rename file.");
    }

    return 0;
}
```
