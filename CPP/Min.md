# Min

This function returns the minimum of two specified values.

## Syntax

- float **Min**(const float value0, const float value1)
- double **Min**(const double value0, const double value1)
- int **Min**(const int value0, const int value1)

## Returns

Returns the lowest of the two specified values.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float a = 5;
    float b = 3;
    
    Print(Min(a,b));

    return 0;
}
```
