# GetUserId

Namespace: [Steamworks](Steamworks.md)

This function gets the user's Steam profile ID.

## Syntax

- uint64_t **GetUserId**()

## Returns

Returns the user ID.

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

    //Get app ID
    auto appid = Steamworks::GetAppId();
    Print("App ID: " + String(appid));

    //Get build ID
    auto buildid = Steamworks::GetBuildId();
    Print("Build ID: " + String(buildid));

    //Confirm app installed
    bool installed = Steamworks::AppInstalled(appid);
    Print("App installed: " + String(installed));

    //Confirm app owned
    bool owned = Steamworks::AppSubscribed(appid);
    Print("App subscribed: " + String(owned));

    //Get user ID
    auto id = Steamworks::GetUserId();
    Print("User ID: " + String(id));

    //Get user name
    Print("User name: " + Steamworks::GetUserName(id));

    //Get user avatar
    auto pixmap = Steamworks::GetUserAvatar(id);
    if (pixmap)
    {
        pixmap->Save("avatar.dds");
        RunFile("avatar.dds");
    }
    
    Steamworks::Shutdown();
    return 0;
}
```
