# Mod

This function performs a modulus operation and returns the result.

## Syntax

- float **Mod**(const float value, const float divisor)
- double **Mod**(const double value, const double divisor)

| Parameter | Description |
| --- | --- |
| value | value to determine the modulus for |
| divisor | value to divide by |

## Returns

Returns the result of the modulus operation.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float a = 735;
    a = Mod(a, 360);
    Print(a);
    return 0;
}
```
