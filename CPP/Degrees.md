# Degrees

This function converts an angle from radians to degrees.

## Syntax

- float **Radians**(const float angle)
- double **Radians**(const double angle)

| Parameter | Description |
| --- | --- |
| angle | angle in radians |

## Returns

Returns the angle, converted to degrees.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float a = 45;
    float r = Radians(a);
    Print(r);
    Print(Degrees(r));
    return 0;
}
```
