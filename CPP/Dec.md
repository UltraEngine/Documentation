# Dec

This function converts a hexadecimal value into a decimal number and returns the result.

## Syntax

- uint64_t **Dec**(const [String](String.md)& hex)

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
