# WString::Lower
This method returns the lowercase version of the wide string.

- [WString](WString.md) **Lower**()

## Returns
Returns the string, converted to lowercase.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "John Smith";
    Print(s.Lower());

    return 0;
}
```
