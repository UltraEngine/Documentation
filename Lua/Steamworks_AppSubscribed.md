# AppSubscribed

Namespace: [Steamworks](Steamworks.md)

This function checks to see if an application is authorized for usage by the user.

## Syntax

- boolean **AppSubscribed**(number appid)

| Parameter | Description |
|---|---|
| appid | the Steam app ID to check |

## Returns

Returns true if the specified application can be run by the user. This usually means the application is owned by the user, but will also return true if the app is being loaned or is free to play for a temporary period.

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/auth) for additional information about autnentication and ownership of games.

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

    auto appid = Steamworks::GetAppId();
    Print("App subscribed: " + String(Steamworks::AppSubscribed(appid)));
    Print("App installed: " + String(Steamworks::AppInstalled(appid)));

    Steamworks::Shutdown();
    return 0;
}
```
