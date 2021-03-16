# Vec3::Reflect

This method bounces this vector off a specified normal vector and returns the result.

## Syntax

- [Vec3](Vec3.md) **Reflect**(const [Vec3](Vec3.md)& normal)

| Parameter | Description |
|-|-|
|normal|surface normal to bounce the vector off of.|

## Returns

Returns the reflected vector.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //The motion is pointing down and forward
    Vec3 motion = Vec3(0, -1, 1);

    //The ground is pointing up
    Vec3 ground = Vec3(0, 1, 0);

    //Calculate bounce angle
    Vec3 bounce = motion.Reflect(ground);

    //The bounce angle should be up and forward
    Print(String(bounce.x) + ", " + String(bounce.y) + ", " + String(bounce.z));

    return 0;
}
```
