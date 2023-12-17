# GetUserName

This function retrieves the display name for the specified user ID.

## Syntax

- [WString](WString.md) **GetUserName**(const uint64 userid)

| Parameter | Description |
|---|---|
| userid | user ID to return the name of |

## Returns 

Returns the user's display name.

## Example

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
    auto id = Steamworks::GetUserId();
    Print("User ID: " + String(id));
    Print("User name: " + Steamworks::GetUserName(id));

    Steamworks::Shutdown();
    return 0;
}
```
