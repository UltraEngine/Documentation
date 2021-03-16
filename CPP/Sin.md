# Sin

This function returns the sine of the specified angle.

## Syntax

- float **Sin**(const float angle)
- double **Sin**(const double angle)

| Parameter | Description |
| --- | --- |
| angle | angle, in degrees |

## Returns

Returns the sine of the specified angle.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float angle = 65;

    Print("Sin: " + String(Sin(angle)));
    Print("Cos: " + String(Cos(angle)));
    Print("Tan: " + String(Tan(angle)));

    return 0;
}
```
