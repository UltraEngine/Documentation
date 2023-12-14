# Steamworks::RecordVoice

This function sets the microphone recording mode and broadcasts the user's voice to other players in the game.

## Syntax

- void **RecordVoice**(const bool record)

## Remarks

When voice recording is active, your program should provide a visual cue showing the player they can speak.

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
    
    // Get the displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[0]->scale, 720 * displays[0]->scale, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    // Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    // Create world
    auto world = CreateWorld();

    // Create camera
    auto camera = CreateCamera(world);

    // Create lobby
    auto lobby = Steamworks::CreateLobby(Steamworks::LOBBY_PRIVATE);
    
    // Main loop
    while (not window->KeyDown(KEY_ESCAPE) and not window->Closed())
    {
        while (PeekEvent())
        {
            const auto e = WaitEvent();
            switch (e.id)
            {            
            case Steamworks::EVENT_LOBBYINVITEACCEPTED:
            case Steamworks::EVENT_LOBBYDATACHANGED:
            case Steamworks::EVENT_LOBBYUSERJOIN:
            case Steamworks::EVENT_LOBBYUSERLEAVE:
            case Steamworks::EVENT_LOBBYUSERDISCONNECT:
                auto info = e.source->As<Steamworks::LobbyEventInfo>();
                auto username = Steamworks::GetUserName(info->userid);
                switch (e.id)
                {
                case Steamworks::EVENT_LOBBYINVITEACCEPTED:
                    Print("Invite accepted to lobby " + String(info->lobbyid));
                    if (not Steamworks::JoinLobby(info->lobbyid))
                    {
                        Print("Failed to join lobby");
                    }
                    break;
                case Steamworks::EVENT_LOBBYDATACHANGED:
                    Print("New lobby owner " + username);
                    break;
                case Steamworks::EVENT_LOBBYUSERJOIN:
                    Print("User " + username + " joined");
                    break;
                case Steamworks::EVENT_LOBBYUSERLEAVE:
                    Print("User " + username + " left");
                    break;
                case Steamworks::EVENT_LOBBYUSERDISCONNECT:
                    Print("User " + username + " disconnected");
                    break;
                }
                break;
            }
        }

        // Enable voice chat when the C key is pressed
        bool record = window->KeyDown(KEY_C);
        Steamworks::RecordVoice(record);
        if (record)
        {
            window->SetText("Ultra Engine (Microphone Enabled)");
        }
        else
        {
            window->SetText("Ultra Engine");
        }

        // Open friend invite interface when space key is pressed
        auto newlobby = Steamworks::CurrentLobby();
        if (window->KeyHit(KEY_SPACE))
        {
            if (newlobby) Steamworks::InviteFriends(newlobby);
        }

        // Update world
        world->Update();

        // Render world
        world->Render(framebuffer);

        // Update Steamworks
        Steamworks::Update();
    }

    // Close Steam
    Steamworks::Shutdown();

    return 0;
}
```
