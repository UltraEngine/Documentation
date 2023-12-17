# AppInstalled

Namespace: [Steamworks](Steamworks.md)

This function checks to see if an application is installed.

## Syntax

- bool **AppInstalled**(const uint64 appid)

| Parameter | Description |
|---|---|
| appid | the Steam app ID to check |

## Returns

Returns true if the specified application is installed and ready to run, otherwise false is returned.

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
