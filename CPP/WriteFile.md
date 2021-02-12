# WriteFile

This function creates a new file and returns a stream for write operations.

## Syntax

- shared_ptr<[Stream](Stream.md)\> **WriteFile**(const [WString](WString.md)& path)

| Parameter | Description |
|--|--|
| **path** | file path to save |

## Returns

Returns an open stream for write operations if the file was successfully created, otherwise NULL is returned.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.txt";

    //Write a new file
    auto stream = WriteFile(path);
    if (stream == NULL)
    {
        Print("Failed to write file.");
        return 0;
    }

    stream->WriteString("Hello, world!");
    stream->Close();

    stream = ReadFile(path);
    Print(stream->ReadString());

    return 0;
}
```