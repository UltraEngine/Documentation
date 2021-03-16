# Vec3::Length

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
    Vec3 v = Vec3(1, 1, 0);
    Print(v.Length());

    return 0;
}
```
