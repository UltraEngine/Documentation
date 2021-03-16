# SeedRandom
This functions sets the seed for psuedorandom number calculation.

## Syntax

- void **SeedRandom**(const int seed)

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    SeedRandom(Millisecs());

    Print(Random());
    Print(Random(10));
    Print(Random(10, 20));
    
    return 0;
}
```
