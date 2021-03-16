# Floor

This functions rounds a decimal number down to the lower integer and returns the result.

## Syntax

- int **Floor**(const float f)
- int64_t **Floor**(const double f)

## Returns

Returns the lower integer value.

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
