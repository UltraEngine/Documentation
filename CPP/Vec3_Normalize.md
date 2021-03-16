# Vec3::Normalize

This method returns the normalized vector. The resulting vector will have a length of one.

## Syntax

- [Vec3](Vec3) **Normalize**()

## Returns

Returns the normalized vector. If the magnitude of this vector is zero, a vector with zero length will be returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec3 v = Vec3(1, 2, 4);
    v = v.Normalize();
    Print(String(v.x) + ", " + String(v.y) + ", " + String(v.z));

    return 0;
}
```
