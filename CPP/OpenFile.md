# OpenFile

This function opens a file and returns a stream for read and write operations. If no file exists at the specified path, a new empty file will be created.

## Syntax

- shared_ptr<[Stream](Stream.md)\> **OpenFile**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| **path** | file path to open |

## Returns

Returns an open stream for read and write operations if the file was successfully created, otherwise NULL is returned.

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
    stream->WriteByte(1);
    stream->WriteDouble(2.0);
    stream->WriteFloat(3.0f);
    stream->WriteInt(4);
    stream->WriteShort(5);

    //Change the stream position
    stream->Seek(0);

    //Read back the data
    Print(stream->ReadByte());
    Print(stream->ReadDouble());
    Print(stream->ReadFloat());
    Print(stream->ReadInt());
    Print(stream->ReadShort());

    //Close the stream
    stream->Close();

    return 0;
}
```