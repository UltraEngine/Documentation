# Seed
This functions sets the seed for psuedorandom number calculation.

## Syntax

- void **Seed**(const int seed)

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
