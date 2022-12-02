# RuntimeError #
This function generates a critical error and exits the program.

## Syntax ##
- void **RuntimeError**(const [WString](WString.md)& message)

| Parameter | Description |
| --- | --- |
| message | error message to print |

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    try
    {
        RuntimeError("Something went wrong!");
    }
    catch (std::exception e)
    {
        WString error = e.what();
        DebugBreak();
    }
    return 0;
}
