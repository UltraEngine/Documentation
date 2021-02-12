# DebugLog #
In the debug build of your application, this function will print a message. In the release mode this function will perform no action. You can use this to display extra information during development of your application.

## Syntax ##
- void **DebugLog**(const [WString](WString.md)& message)

| Parameter | Description |
| --- | --- |
| message | text to print |

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
#ifdef _DEBUG
    Print("Run this example in release mode to hide the printed output.");
#else
    Print("Run this example in debug mode to see the printed output.");
#endif

    DebugLog("Here is some debug information.");
    return 0;
}
```