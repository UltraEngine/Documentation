# Stream ::Flush

This method writes all queued data to the stream. You generally do not need to call this.

## Syntax

- void **Flush**()

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

    std::array<char, 1024> data;

    stream->Write(&data[0], data.size() * sizeof(data[0]));

    Print(String(FileSize(path)));

    stream->Flush();

    Print(String(FileSize(path)));

    return 0;
}
```
