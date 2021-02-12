# Warn #
This function can be used to print a non-critical error. Each unique message this function receives will only be printed once, preventing the print output from being flooded with repeated messages.

## Syntax ##
- void **Warn**(const [WString](WString.md)& message)

| Parameter | Description |
| --- | --- |
| message | warning message to print |

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    for (int n = 0; n < 10; ++n)
    {
        Warn("Please don't do that anymore!");
    }
    return 0;
}
```