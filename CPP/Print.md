# Print

This function prints a line of text to the program output.

## Syntax

- void **Print**(const WString& data)
- void **Print**(const String& data)
- void **Print**(const int data)
- void **Print**(const float data)
- void **Print**(const double data)

| Parameter | Description |
|---|---|
| data | data to display as a string |

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
