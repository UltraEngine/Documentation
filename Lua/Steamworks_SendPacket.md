# SendPacket

Namespace: [Steamworks](Steamworks.md)

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

```lua
-- Define the Player class
Player = {}
Player.__index = Player

-- Static map to store players
Player.players = {}

-- Player constructor
function Player.new(world, userid)
    local self = setmetatable({}, Player)
    self.entity = CreatePivot(world)
    local model = CreateCylinder(world, 0.25, 1.8)
    model:SetPosition(0, 0.9, 0)
    model:SetParent(self.entity)
    model:SetCollider(nil)
    self.userid = userid
    Player.players[userid] = self
    return self
end

-- Static method to get or create a player
function Player.Get(world, userid)
    if Player.players[userid] then
        return Player.players[userid]
    end
    return Player.new(world, userid)
end

-- Static method to remove a player
function Player.Remove(userid)
    Player.players[userid] = nil
end

-- Define the PlayerState struct
PlayerState = {}
PlayerState.__index = PlayerState

-- PlayerState constructor
function PlayerState.new(position, yaw)
    local self = setmetatable({}, PlayerState)
    self.position = position
    self.yaw = yaw
    return self
end

-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[0].scale, 720 * displays[0].scale, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()
world:SetGravity(0, -18, 0)

-- Create lobby
local lobbyid = Steamworks.CreateLobby(Steamworks.LOBBY_PUBLIC)
Print("Lobby: " .. String(lobbyid))

-- Spawn local player
local player = Player.Get(world, Steamworks.GetUserId())
player.entity: AddComponent(FirstPersonControls)

-- Add lighting
local light = CreateDirectionalLight(world)
light:SetRotation(55, 35, 0)

-- Add a floor
local floor = CreateBox(world, 50, 1, 50)
floor:SetPosition(0, -0.5, 0)
local mtl = CreateMaterial()
mtl:SetTexture(LoadTexture("https://github.com/UltraEngine/Documentation/raw/master/Assets/Materials/Developer/griid_gray.dds"))
floor:SetMaterial(mtl)

-- Main loop
while not window:KeyDown(KEY_ESCAPE) and not window:Closed() do
    while PeekEvent() do
        local e = WaitEvent()
        if e.id == Steamworks.EVENT_LOBBYINVITEACCEPTED or
           e.id == Steamworks.EVENT_LOBBYDATACHANGED or
           e.id == Steamworks.EVENT_LOBBYUSERJOIN or
           e.id == Steamworks.EVENT_LOBBYUSERLEAVE or
           e.id == Steamworks.EVENT_LOBBYUSERDISCONNECT then

            local info = e.source:As(Steamworks.LobbyEventInfo)
            local username = Steamworks.GetUserName(info.userid)

            if e.id == Steamworks.EVENT_LOBBYINVITEACCEPTED then
                Print("Invite accepted to lobby " .. String(info.lobbyid))
                lobbyid = info.lobbyid
                if not Steamworks.JoinLobby(info.lobbyid) then
                    lobbyid = 0
                    Print("Failed to join lobby")
                end
            elseif e.id == Steamworks.EVENT_LOBBYDATACHANGED then
                Print("New lobby owner " .. username)
            elseif e.id == Steamworks.EVENT_LOBBYUSERJOIN then
                Print("User " .. username .. " joined")

                if not Player.players[info.userid] then
                    -- Spawn remote player
                    Player.Get(world, info.userid)
                end
            elseif e.id == Steamworks.EVENT_LOBBYUSERLEAVE then
                Print("User " .. username .. " left")

                -- Remove remote player
                Player.Remove(info.userid)
            elseif e.id == Steamworks.EVENT_LOBBYUSERDISCONNECT then
                Print("User " .. username .. " disconnected")

                -- Remove remote player
                Player.Remove(info.userid)
            end
        end
    end

    -- Receive player data
    local state = PlayerState.new(Vec3(), 0)
    while true do
        local pak = Steamworks.GetPacket()
        if not pak then
            break
        end
        if pak.data:GetSize() == sizeof(PlayerState) then
            local player = Player.Get(world, pak.userid)
            if player then
                pak.data:Peek(0, state, pak.data:GetSize())
                player.entity:SetPosition(state.position)
                player.entity:SetRotation(state.yaw)
            end
        end
    end

    -- Receive text messages
    while true do
        local pak = Steamworks.GetPacket(1)
        if not pak then
            break
        end
        local s = pak.data:PeekString(0)
        Print(Steamworks.GetUserName(pak.userid) .. ": " .. WString(s))
    end

    -- Send player data
    local userid = Steamworks.GetUserId()
    local player = Player.players[userid]
    state.position = player.entity.position
    state.yaw = player.entity.rotation.y

    -- You could also call BroadcastPacket() to send the packet to each other member in the lobby
    local members = GetLobbyMembers(lobbyid)
    for n = 1, #members do
        Steamworks.BroadcastPacket(members[n], state, sizeof(PlayerState), 0, Steamworks.P2PSEND_UNRELIABLENODELAY)
    end

    -- Enable voice chat when the C key is pressed
    local record = window:KeyDown(KEY_C)
    Steamworks.RecordVoice(record)
    local title = "Ultra Engine"
    if record then
        title = title .. " (Microphone Enabled)"
    end
    window:SetText(title)

    -- Update world
    world:Update()

    -- Render world
    world:Render(framebuffer)

    -- Update Steamworks
    Steamworks.Update()
end

-- Close Steam
Steamworks.Shutdown()
```
