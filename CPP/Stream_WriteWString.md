# Stream::WriteWString

This method writes a wide string to the stream at the current position.

## Syntax

- void **WriteWString**(const [WString](WString.md)& s, const bool terminate = true)

| Parameter | Description |
|---|---|
| s | string to write |
| terminate | if true an extra short with a value of zero will be written at the end of the string |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

//This example saves a wide string to a UTF-16 encoded text file.

int main(int argc, const char* argv[])
{
    WString s = L"Привет, как ты сегодня? Я в порядке.";

    WString path = GetPath(PATH_DOCUMENTS) + "/temp.txt";
    auto stream = WriteFile(path);
    stream->WriteByte(255);
    stream->WriteByte(254);
    stream->WriteWString(s, false);
    stream->Close();

    RunFile(path);

    return 0;
}
```
