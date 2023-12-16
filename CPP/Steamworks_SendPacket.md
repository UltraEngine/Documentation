# SendPacket

This function sends a packet of data to another user who is in the same lobby.

## Syntax

- bool **SendPacket**(const uint64 userid, const [WString](WString)& data, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)
- bool **SendPacket**(const uint64 userid, std::shared_ptr<[Buffer](Buffer.md)\> data, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)
- bool **SendPacket**(const uint64 userid, const void* data, const uint32 size, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)

| Parameter | Description |
|---|---|
| userid | user ID to send the data to |
| data | data to send |
| channel | packet channel to use |
| size | size of data to send |
| sendtype | can be P2PSEND_UNRELIABLE, P2PSEND_UNRELIABLENODELAY, P2PSEND_RELIABLE, or P2PSEND_RELIABLEBUFFERED |

## Returns

Returns true of the packet was successfully sent. (This does not necessarily mean the packet was successfully received.)

## Example

This example demonstrates lobbies, voice chat, and simple player movement.

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

class Player : public Object
{
public:
    static inline std::map<uint64_t, shared_ptr<Player> > players;

    shared_ptr<Entity> entity;
    WString name;
    uint64_t userid;

    static std::shared_ptr<Player> Get(shared_ptr<World> world, const uint64_t userid)
    {
        if (players[userid]) return players[userid];
        auto player = std::make_shared<Player>();
        player->entity = CreatePivot(world);
        auto model = CreateCylinder(world, 0.25, 1.8);
        model->SetPosition(0, 0.9, 0);
        model->SetParent(player->entity);
        model->SetCollider(nullptr);
        player->userid = userid;
        players[userid] = player;
        return player;
    }

    static void Remove(const uint64_t userid)
    {
        players[userid] = nullptr;
    }
};

struct PlayerState
{
    Vec3 position;
    float yaw;
};

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
    world->SetGravity(0, -18, 0);

    // Create lobby
    auto lobbyid = Steamworks::CreateLobby(Steamworks::LOBBY_PUBLIC);
    
    Print("Lobby: " + String(lobbyid));
     
    // Spawn local player
    auto player = Player::Get(world, Steamworks::GetUserId());
    player->entity->AddComponent<FirstPersonControls>();

    // Add lighting
    auto light = CreateDirectionalLight(world);
    light->SetRotation(55, 35, 0);

    // Add a floor
    auto floor = CreateBox(world, 50, 1, 50);
    floor->SetPosition(0, -0.5, 0);
    auto mtl = CreateMaterial();
    mtl->SetTexture(LoadTexture("https://github.com/UltraEngine/Documentation/raw/master/Assets/Materials/Developer/griid_gray.dds"));
    floor->SetMaterial(mtl);

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
                    lobbyid = info->lobbyid;
                    if (not Steamworks::JoinLobby(info->lobbyid))
                    {
                        lobbyid = 0;
                        Print("Failed to join lobby");
                    }
                    break;
                
                case Steamworks::EVENT_LOBBYDATACHANGED:
                    Print("New lobby owner " + username);
                    break;

                case Steamworks::EVENT_LOBBYUSERJOIN:
                    Print("User " + username + " joined");

                    if (not Player::players[info->userid])
                    {
                        // Spawn remote player
                        Player::Get(world, info->userid);
                    }

                    break;
                case Steamworks::EVENT_LOBBYUSERLEAVE:
                    Print("User " + username + " left");

                    // Remove remote player
                    Player::Remove(info->userid);

                    break;
                case Steamworks::EVENT_LOBBYUSERDISCONNECT:
                    Print("User " + username + " disconnected");

                    // Remove remote player
                    Player::Remove(info->userid);

                    break;
                }
                break;
            }
        }

        // Receive player data
        PlayerState state;
        while (true)
        {
            auto pak = Steamworks::GetPacket();
            if (not pak) break;
            if (pak->data->GetSize() == sizeof(PlayerState))
            {
                auto player = Player::Get(world, pak->userid);
                if (player)
                {
                    pak->data->Peek(0, (const char*)&state, pak->data->GetSize());
                    player->entity->SetPosition(state.position);
                    player->entity->SetRotation(state.yaw);
                }
            }
        }

        //Receive text messages
        while (true)
        {
            auto pak = Steamworks::GetPacket(1);
            if (not pak) break;
            String s = pak->data->PeekString(0);
            Print(Steamworks::GetUserName(pak->userid) + ": " + WString(s));
        }

        // Send player data
        auto userid = Steamworks::GetUserId();
        auto player = Player::players[userid];
        state.position = player->entity->position;
        state.yaw = player->entity->rotation.y;
        Steamworks::BroadcastPacket(lobbyid, &state, sizeof(PlayerState), 0, Steamworks::P2PSEND_UNRELIABLENODELAY);

        // Enable voice chat when the C key is pressed
        bool record = window->KeyDown(KEY_C);
        Steamworks::RecordVoice(record);
        String title = "Ultra Engine";
        if (record) title += " (Microphone Enabled)";
        window->SetText(title);

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
