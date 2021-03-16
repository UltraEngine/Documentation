# Ceil

This functions rounds a decimal number up to the upper integer and returns the result.

## Syntax

- int **Ceil**(const float f)
- int64_t **Ceil**(const double f)

## Returns

Returns the upper integer value.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    float f = 1.6f;
    Print(Ceil(f));
    Print(Floor(f));    
    return 0;
}
```
