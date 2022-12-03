# Stream::EoF

This method returns true when the end of the stream is reached.

## Syntax

- bool **EoF**()

## Returns

Returns true if the file position is equal to the stream size minus one, otherwise false is returned.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = GetPath(PATH_DOCUMENTS) + "/temp.bin";

    //Open a stream with read and write permissions
    DeleteFile(path);
    auto stream = OpenFile(path);
    if (stream == NULL)
    {
        Print("Failed to write file.");
        return 0;
    }

    //Write some data
    for (int n = 0; n < 10; ++n)
    {
        stream->WriteInt(n);
    }

    //Change the stream positio
    stream->Seek(0);

    //Read back the data
    while (!stream->EOF())
    {
        Print(stream->ReadInt());
    }

    return 0;
}
```
