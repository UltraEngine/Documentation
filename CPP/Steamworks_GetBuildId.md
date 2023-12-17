# GetBuildId

Namespace: [Steamworks](Steamworks.md)

This functions retrieves the build ID for this game.

## Syntax

- uint64 **GetBuildId**()

## Returns

Returns the game's Steam build ID.

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Initialize Steam
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }

    Print("App ID: " + String(Steamworks::GetAppId()));
    Print("Build ID: " + String(Steamworks::GetBuildId()));
    auto id = Steamworks::GetUserId();
    Print("User ID: " + String(id));
    Print("User name: " + Steamworks::GetUserName(id));

    Steamworks::Shutdown();
    return 0;
}
```
