# SetStat

Namespace: [Steamworks](Steamworks.md)

This function sets a user statitics value for this game.

## Syntax

- bool **SetStat**([WString](WString.md) key, const int value)

| Parameter | Description |
|---|---|
| key | name of user statistic to set |
| value | value to set |

## Returns

Returns true if the user statistic is successfully stored, otherwise false is returned.

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
