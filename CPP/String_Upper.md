# String::Upper #
This method returns the uppercase version of the string.

- [String](String.md) **Upper**()

## Returns ##
Returns the string, converted to uppercase.

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    String s = "John Smith";
    Print(s.Upper());

    return 0;
}
```
