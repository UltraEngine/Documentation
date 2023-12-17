# JoinLobby

Namespace: [Steamworks](Steamworks.md)

This functions joins a game lobby.

## Syntax

- boolean **JoinLobby**(number lobbyid)

| Parameter | Description |
|---|---|
| lobbyid | ID of the lobby to invite friends to |

## Returns

Returns true if the lobby is successfully joined, otherwise false is returned.

## Example

```lua
-- Initialize Steamworks
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return 1
end

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[1].scale, 720 * displays[1].scale, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Create camera
local camera = CreateCamera(world)

-- Create lobby
local lobby = Steamworks.CreateLobby()

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
                if not Steamworks.JoinLobby(info.lobbyid) then
                    Print("Failed to join lobby")
                end
            elseif e.id == Steamworks.EVENT_LOBBYDATACHANGED then
                Print("New lobby owner " .. username)
            elseif e.id == Steamworks.EVENT_LOBBYUSERJOIN then
                Print("User " .. username .. " joined")
            elseif e.id == Steamworks.EVENT_LOBBYUSERLEAVE then
                Print("User " .. username .. " left")
            elseif e.id == Steamworks.EVENT_LOBBYUSERDISCONNECT then
                Print("User " .. username .. " disconnected")
            end
        end
    end

    -- Enable voice chat when the C key is pressed
    local record = window:KeyDown(KEY_C)
    Steamworks.RecordVoice(record)
    if record then
        window:SetText("Ultra Engine (Microphone Enabled)")
    else
        window:SetText("Ultra Engine")
    end

    -- Open friend invite interface when space key is pressed
    local newlobby = Steamworks.CurrentLobby()
    if window:KeyHit(KEY_SPACE) then
        if newlobby then
            Steamworks.InviteFriends(newlobby)
        end
    end

    -- Update world
    world:Update()

    -- Render world
    world:Render(framebuffer)

    -- Update Steamworks
    Steamworks.Update()
end

-- Close Steamworks
Steamworks.Shutdown()
```
