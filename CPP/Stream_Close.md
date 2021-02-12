# Stream::Close #
This method manually closes the stream for further read and write operations.

## Syntax ##
- void **Close**()

## Remarks ##
It is not necessary to call this method, as a stream will automatically close when it is deleted, but this method provides an additional mechanism to explicitly close it. This could be useful if you are not sure if the shared pointer is stored somewhere else in your program.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.bin";

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