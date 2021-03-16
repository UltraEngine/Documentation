# Radians

This function converts an angle from degrees to radians.

## Syntax

- float **Radians**(const float angle)
- double **Radians**(const double angle)

| Parameter | Description |
| --- | --- |
| angle | angle in degrees |

## Returns

Returns the angle, converted to radians.

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
