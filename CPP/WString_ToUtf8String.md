# WString::ToUtf8String

This method converts the wide string to a narrow string using UTF-8 encoding. This allows a narrow string to store a larger range of widestring characters in a narrow string. However, some string operations will not work correctly with a UTF8 string.

## Syntax

- [String](String.md) **ToUtf8String**()

## Returns

Returns a narrow string with UTF-8 encoding.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString ws = L"你好，你今天好吗？";
    String s = ws.ToString();

    Print(s);
    if (ws == s)
    {
        Print("Short string matches wide string");
    }
    else
    {
        Print("Short string does not match wide string");
    }

    Print("");

    s = ws.ToUtf8String();

    Print(s);
    if (ws == s)
    {
        Print("Short string matches wide string");
    }
    else
    {
        Print("Short string does not match wide string");
    }

    return 0;
}
```
