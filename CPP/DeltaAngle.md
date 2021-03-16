# DeltaAngle

This function returns the smallest angle between two specified angles.

## Syntax

- float **DeltaAngle**(const float angle0, const float angle1)
- double **DeltaAngle**(const double angle0, const double angle1)

## Returns

Returns the smallest angle between the two angles, in degrees.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float a0 = 10;
    float a1 = 355;

    Print(DeltaAngle(a0,a1));

    return 0;
}
```
