# String::Right #
This method returns the rightmost characters of the string.

## Syntax ##
- [String](String.md) **Right**(const int count)

| Parameter | Description |
| --- | --- |
| length | maximum number of characters to return |

## Returns ##
Returns the rightmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    String s = "Hello, how are you today?";
    Print(s.Right(6));

    return 0;
}
```
