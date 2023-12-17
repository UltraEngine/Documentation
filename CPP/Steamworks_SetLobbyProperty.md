# SetLobbyProperty

Namespace: [Steamworks](Steamworks.md)

Namespace: [Steamworks](Steamworks.md)

This function sets a key/value pair that can be read by other users.

## Syntax

- bool **SetLobbyProperty**(const [WString](WString.md)& key, const [WString](WString.md)& value)

## Remarks

Users do not have to be in the lobby to retrieve properties set with this command.

## Remarks

When a lobby property changes an LOBBYDATACHANGED event will be emitted for all users.

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
