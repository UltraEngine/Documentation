# Hex

This function converts a decimal value into a hexadecimal number and returns the result.

## Syntax

- [String](String.md) **Hex**(const uint64_t dec)

| Parameter | Description |
| --- | --- |
| dec | decimal number |

## Returns

Returns a string containing the hexadecimal number.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    int i = 1024;
    String s = Hex(i);
    Print(s);
    Print(Dec(s));
    return 0;
}
```
