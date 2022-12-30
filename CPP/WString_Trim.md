# WString::Trim

This method removes whitespace characters from the beginning and end of the wide string and returns the result.

## Syntax

- [WString](WString) **Trim**()

## Returns

Returns the string with whitespace characters removed from the beginning and end.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "    Hello!  ";
    Print("\"" + s.Trim() + "\"");

    return 0;
}
```
