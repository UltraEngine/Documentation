# GetStat

Namespace: [Steamworks](Steamworks.md)

This function gets a statistic for the user for this game.

## Syntax

- int **GetStat**(const [WString](WString.md)& name)

## Returns

Returns the statistic value, or -1 if the value cannot be retrieved.

## Example

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }

    //Retrieve the current value
    int value = Steamworks::GetStat("NumWins");
    Print(value);
    
    //Set a new value
    Steamworks::SetStat("NumWins", 105);

    Steamworks::Shutdown();
    return 0;
}
```
