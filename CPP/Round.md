# Round

This functions rounds a decimal number off to the nearest integer and returns the result.

## Syntax

- int **Round**(const float f)
- int64_t **Round**(const double f)

## Returns

Returns the nearest integer value.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(Round(1.9f));
    return 0;
}
```
