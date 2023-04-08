# Print

This function prints a line of text to the program output.

## Syntax

- void **Print**(const [WString](WString.md)& value, const bool linereturn = true)
- void **Print**(const [String](String.md)& value, const bool linereturn = true)
- void **Print**(const int value, const bool linereturn = true)
- void **Print**(const float value, const bool linereturn = true)
- void **Print**(const double value, const bool linereturn = true)

| Parameter | Description |
|---|---|
| value | string or data to display |
| linereturn | set to true to add a new line character at the end |

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
  Print("Hello, world!");
  return 0;
}
```
