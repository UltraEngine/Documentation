# WString::Upper

This method returns the uppercase version of the wide string.

- [WString](WString.md) **Upper**()

## Returns

Returns the string, converted to uppercase.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "John Smith";
    Print(s.Upper());

    return 0;
}
```
