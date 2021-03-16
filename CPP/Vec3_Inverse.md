# Vec3::Inverse

This method returns the inverse of this vector.

## Syntax

- [Vec3](Vec3.md) **Inverse**()

## Returns

Returns the inverse vector.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec3 v = Vec3(1, 2, 3);
    v = v.Inverse();

    Print(String(v.x) + ", " + String(v.y) + ", " + String(v.z));

    return 0;
}
```
