# Vec3::Cross

This method returns the cross product of this vector and the specified vector.

## Syntax

- [Vec3](Vec3.md) **Cross**(const [Vec3](Vec3.md)& v)

| Parameter | Description |
|-|-|
|v|vector to return the cross product of.|

## Returns

Returns the cross product of this vector and the specified vector.

## Remarks

The cross product calculates a vector that is perpindicular to both input vectors. If both vectors are the same this method will return a vector with a length of zero.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec3 v0 = Vec3(1, 0, 0);
    Vec3 v1 = Vec3(0, 1, 0);
    Vec3 v2 = v0.Cross(v1);

    Print(String(v2.x) + ", " + String(v2.y) + ", " + String(v2.z));

    return 0;
}
```
