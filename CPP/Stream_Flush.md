# Stream::Flush

This method writes all queued data to the stream. You generally do not need to call this, as it will be done automatically.

## Syntax

- void **Flush**()

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.bin";

    //Write a new file
    auto stream = WriteFile(path);
    if (stream == NULL)
    {
        Print("Failed to write file.");
        return 0;
    }

    std::array<char, 1024> data;

    stream->Write(&data[0], data.size() * sizeof(data[0]));

    Print("File size before Stream::Flush(): " + String(FileSize(path)));

    stream->Flush();

    Print("File size after Stream::Flush(): " + String(FileSize(path)));

    return 0;
}
```
