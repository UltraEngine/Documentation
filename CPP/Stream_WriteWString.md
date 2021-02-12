# Stream::WriteWString #
This method writes a wide string to the stream at the current position.

## Syntax ##
- void **WriteWString**(const [WString](WString.md)& s, const bool terminate = true)

### Parameters ###
| Name | Description |
|---|---|
| s | string to write |
| terminate | if true an extra short with a value of zero will be written at the end of the string |

## Example ##
This example will save a wide string to a UTF-16 encoded text file.

```c++

#include "pch.h"

using namespace UltraEngine;
 
int main(int argc, const char* argv[])
{
    WString s = L"Привет, как ты сегодня? Я в порядке.";
    auto strean = WriteFile("utf-16.txt");
    stream->WriteByte(255);
    stream->WriteByte(254);
    stream->WriteWString(s, false);
}
```
