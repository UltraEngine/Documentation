# ASin

This function returns the arc sine of the specified value.

## Syntax

- float **ASin**(const float value)
- double **ASin**(const double value)

| Parameter | Description |
| --- | --- |
| value | sine value |

## Returns

Returns the arc sine.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float angle = -65.0f;

    float s = Sin(angle);
    float c = Cos(angle);
    float t = Tan(angle);

    Print("Sin: " + String(ASin(s)));
    Print("Cos: " + String(ACos(c)));
    Print("Tan: " + String(ATan(t)));

    return 0;
}
```
