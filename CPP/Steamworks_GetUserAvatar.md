# GetUserAvatar

Namespace: [Steamworks](Steamworks.md)

This function retrieves the user's profile picture.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **GetUserAvatar**(const uint64 userid)

| Parameter | Description |
|---|---|
| userid | user ID to retrieve the profile picture of |

## Returns

Returns a pixmap with the user's profile picture.

## Example

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Initialize Steam
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }

    auto userid = Steamworks::GetUserId();
    auto pixmap = Steamworks::GetUserAvatar(userid);
    pixmap->Save("avatar.dds");
    RunFile("avatar.dds");

    // Close Steam
    Steamworks::Shutdown();

    return 0;
}
```
