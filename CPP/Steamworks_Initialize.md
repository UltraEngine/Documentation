# Initialize

Namespace: [Steamworks](Steamworks.md)

This function initializes the Steamworks API. It should be called at the start of any Steam application.

## Syntax

- bool **Initialize**()

## Returns

Returns true if Steamworks is successfully initialized, otherwise false is returned.

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
