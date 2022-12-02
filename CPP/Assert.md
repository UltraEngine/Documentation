# Assert
This function produces a runtime error if the supplied condition or object is false or NULL.

## Syntax

- void **Assert**(const bool condition)
- void **Assert**(const bool condition, const [WString](WString.md)& message)
- void **Assert**(shared_ptr<[Object](Object.md)\> o)
- void **Assert**(shared_ptr<[Object](Object.md)\> o, const [WString](WString.md)& message) 

| Paraemter | Description |
|---|---|
| condition | if false a runtime error is generated |
| o | if NULL a runtime error is generated |
| message | error message to display |

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    try
    {
        Assert(false);
    }
    catch (std::exception e)
    {
        WString error = e.what();
        DebugBreak();
    }
    return 0;
}
```
