# Vec2::Length

This method returns the length of the vector.

## Syntax

- float **Length**()

## Returns

Returns the length of the vector.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec2 v = Vec2(3, 5);
    Print(v.Length());

    return 0;
}
```
