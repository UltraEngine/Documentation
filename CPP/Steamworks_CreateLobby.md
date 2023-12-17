# CreateLobby

This function creates a new lobby.

## Syntax

- uint64 **CreateLobby**(const LobbyType type = LOBBY_PUBLIC, const int capacity = 16)

| Parameter | Description |
|---|---|
| type | can be LOBBY_PUBLIC, LOBBY_PRIVATE, or LOBBY_FRIENDSONLY |
| capacity | maximum number of players allowed |

## Returns

Returns a new lobby if successful, otherwise zero is returned.

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/multiplayer/matchmaking) for additional information.

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

    String gamename = "Universal Tailor";
    String servername = "My Cool Server";

    table properties;
    properties["game"] = gamename;

    auto lobby = Steamworks::CreateLobby();
    Print("Created lobby " + String(lobby));
    Steamworks::SetLobbyProperty(lobby, "game", gamename);
    Steamworks::SetLobbyProperty(lobby, "name", servername);

    Sleep(1000);// we have to pause briefly before the lobby will be listed in search results

    auto lobbies = Steamworks::GetLobbies(properties);
    Print(String(lobbies.size()) + " lobbies found");
    for (int n = 0; n < lobbies.size(); ++n)
    {
        Print(String(n) + ": " + String(lobbies[n]));
        Print("Max players: " + String(Steamworks::GetLobbyCapacity(lobbies[n])));
        Print("Name: " + Steamworks::GetLobbyProperty(lobbies[n], "name"));
    }

    Steamworks::Shutdown();
    return 0;
}
```
