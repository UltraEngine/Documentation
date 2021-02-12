# CurrentDir #
This function returns the path of current folder.

## Syntax ##
- [WString](WString.md) **CurrentDir**()

## Returns ##
Returns the current folder location.

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(CurrentDir());
    return 0;
}
```