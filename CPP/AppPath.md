# AppPath

This function returns the path of the application executable.

## Syntax

- [WString](WString.md) **AppPath**()

## Returns

Returns the path of the launched executable.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(AppPath());
    return 0;
}
```
