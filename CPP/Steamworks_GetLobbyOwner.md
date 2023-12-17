# GetLobbyOwner

Namespace: [Steamworks](Steamworks.md)

This function retrieves the lobby's owner.

## Syntax

- uint64 **GetLobbyOwner**(const uint64 lobby)

| Parameter | Description |
|---|---|
| lobby | lobby ID |

## Returns

Returns the user ID of the lobby's owner if the user is in the lobby, otherwise zero is returned.

## Remarks

If the owner of a lobby leaves, ownership will be transfered to another user and a LOBBYDATACHANGED event will be emitted.

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

    auto lobby = Steamworks::CreateLobby();
    auto owner = Steamworks::GetLobbyOwner(lobby);

    Print("Lobby: " + String(lobby));
    Print("Owner: " + Steamworks::GetUserName(owner));

    Steamworks::Shutdown();
    return 0;
}
```
