# Vec2::Normalize

This method returns the normalized vector. The resulting vector will have a length of one.

## Syntax

- [Vec2](Vec2) **Normalize**()

## Returns

Returns the normalized vector. If the magnitude of this vector is zero, a vector with zero length will be returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec2 v = Vec2(3, 5);
    v = v.Normalize();
    Print(String(v.x) + ", " + String(v.y));

    return 0;
}
```
