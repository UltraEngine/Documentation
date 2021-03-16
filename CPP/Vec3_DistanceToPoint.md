# Vec3::DistanceToPoint

This method returns the distance between this point and the specified position.

## Syntax

- [Vec3](Vec3.md) **DistanceToPoint**(const [Vec3](Vec3.md)& position)

| Parameter | Description |
|-|-|
|position|position to return the distance to.|

## Returns

Returns the distance between this point and the specified position.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Vec3 v0 = Vec3(0, 0, 0);
    Vec3 v1 = Vec3(1000, 1000, 0);

    Print(v0.DistanceToPoint(v1));

    return 0;
}
```
