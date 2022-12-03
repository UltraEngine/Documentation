# Stream::WriteWLine

This method writes a line of wide text to the stream at the current position.

## Syntax

- void **WriteWLine**(const [WString](WString.md)& s)

| Parameter | Description |
| --- | --- |
| s | value to write |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

//This example saves a wide string to a UTF-16 encoded text file.

int main(int argc, const char* argv[])
{
    WString path = GetPath(PATH_DOCUMENTS) + "/temp.txt";
    auto stream = WriteFile(path);
    stream->WriteByte(255);
    stream->WriteByte(254);
    stream->WriteWLine(L"Привет, как ты сегодня?");
    stream->WriteWLine(L"Я в порядке.");
    stream->Close();

    RunFile(path);

    return 0;
}
```
