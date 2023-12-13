# Steamworks::RecordVoice

## Syntax

- void **RecordVoice**(const bool record)

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

    auto cl = ParseCommandLine(argc, argv);

    //Join lobby if launching from invite
    if (cl["connect_lobby"].is_integer())
    {
        uint64_t lobbyid = int64_t(cl["connect_lobby"]);
        Print("Joining lobby " + String(lobbyid));
        if (not SteamMatchmaking()->JoinLobby(lobbyid))
        {
            Print("Failed to join lobby.");
            return 0;
        }
    }

    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[0]->scale, 720 * displays[0]->scale, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);

    //Create lobby
    auto lobby = Steamworks::CreateLobby();
    
    //Main loop
    while (not window->KeyDown(KEY_ESCAPE) and not window->Closed())
    {
        //Enable voice chat when the C key is pressed
        Steamworks::RecordVoice(window->KeyDown(KEY_C));

        //Update world
        world->Update();

        //Update Steamworks
        Steamworks::Update();

        //Render world
        world->Render(framebuffer);
    }

    //Close Steam
    Steamworks::Shutdown();

    return 0;
}
```
