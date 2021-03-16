# Max

This function returns the maximum of two specified values.

## Syntax

- float **Max**(const float value0, const float value1)
- double **Max**(const double value0, const double value1)
- int **Max**(const int value0, const int value1)

## Returns

Returns the highest of the two specified values.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float a = 5;
    float b = 3;
    
    Print(Max(a,b));

    return 0;
}
```
