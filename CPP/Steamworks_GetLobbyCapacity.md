# GetLobbyCapacity

Namespace: [Steamworks](Steamworks.md)

This function gets the maximum number of players allowed in the lobby

## Syntax

- int **GetLobbyCapacity**(const uint64 lobby)

| Parameter | Description |
|---|---|
| lobby | lobby ID |

## Returns

Returns the maximum number of players allowed in the lobby.

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
