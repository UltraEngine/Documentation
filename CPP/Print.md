# Print

This function prints a line of text to the program output.

## Syntax

- void **Print**(const WString& value)
- void **Print**(const String& value)
- void **Print**(const int value)
- void **Print**(const float value)
- void **Print**(const double value)

| Parameter | Description |
|---|---|
| value | string or data to display |

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
