# Steamworks::GetStat


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
