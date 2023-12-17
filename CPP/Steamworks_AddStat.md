# AddStat

Namespace: [Steamworks](Steamworks.md)

This function increments the user statistic for this game by the specified value.

- bool **AddStat(const [WString](WString.md)& name, const int add = 1)

## Returns

Returns true if the value was successfully modified, otherwise false is returned.

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

    //Increment the stat
    Steamworks::AddStat("NumWins");

    //Retrieve the current value
    int value = Steamworks::GetStat("NumWins");
    Print(value);
    
    Steamworks::Shutdown();
    return 0;
}
```
