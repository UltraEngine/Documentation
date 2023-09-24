# Random

This function returns a psuedorandom value within the specified range. If no range is specified, the result will be between 0 and 1.

## Syntax

- float **Random**(const float maxima = 1.0f)
- float **Random**(const float minima, const float maxima)

| Parameter | Description |
|---|---|
| minima | minimum value that can be returned |
| maxima | maximum value that can be returned |

## Returns

Returns a psuedorandom number.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Seed(Millisecs());

    Print(Random());
    Print(Random(10));
    Print(Random(10, 20));
    
    return 0;
}
```
