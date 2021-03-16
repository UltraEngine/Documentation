# Cos

This function returns the cosine of the specified angle.

## Syntax

- float **Cos**(const float angle)
- double **Cos**(const double angle)

| Parameter | Description |
| --- | --- |
| angle | angle, in degrees |

## Returns

Returns the cosine of the specified angle.

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
