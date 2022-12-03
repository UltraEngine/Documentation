# AppDir

This function returns the path of the folder the application executable is in. This will return the executable's folder, even if the program is launched with a different working directory.

## Syntax

- [WString](WString.md) **AppDir**()

## Returns

Returns the starting folder the application is launched in.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(AppDir());
    return 0;
}
```
