# WString::Left
This method returns the leftmost characters of the wide string.

## Syntax
- [WString](WString.md) **Left**(const int count)

| Parameter | Description |
| --- | --- |
| length | maximum number of characters to return |

## Returns
Returns the leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "Hello, how are you today?";
    Print(s.Left(5));

    return 0;
}
```
