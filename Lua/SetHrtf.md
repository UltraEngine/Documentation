# SetHrtf

This function enables or disables head-related transfer function audio processing.

## Syntax

- **bool SetHrtf**(bool mode)
  - mode: set to true to enable or false to disable

## Returns

Returns true if the mode is successfully set, otherwise false is returned.

## Remarks

HRTF audio is designed for use with headphones. This should be disabled when using speakers.

HRTF is disabled by default.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

--Create a world
local world = CreateWorld()

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFov(70)
camera:SetPosition(0, 0, -3)
camera:Listen()
camera:Turn(0, 45, 0)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(35, 45, 0)
light:SetRange(-10, 10)

--Create a box
local box = CreateBox(world)
box:SetColor(0, 0, 1)

--Sound
local sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav")
local speaker = CreateSpeaker(sound)
speaker:SetLooping(true)
speaker:SetPosition(box:GetPosition(true))
speaker:Play()
speaker:SetRange(10)

local hrtf = false

--Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    --Toggle HRTF when space key is hit
    if window:KeyHit(KEY_SPACE) then
        hrtf = not hrtf
        SetHrtf(hrtf)
    end

    --Move and turn with the arrow keys - best experienced with headphones
    if window:KeyDown(KEY_UP) then camera:Move(0, 0, 0.1) end
    if window:KeyDown(KEY_DOWN) then camera:Move(0, 0, -0.1) end
    if window:KeyDown(KEY_LEFT) then camera:Turn(0, -1, 0) end
    if window:KeyDown(KEY_RIGHT) then camera:Turn(0, 1, -0) end

    world:Update()
    world:Render(framebuffer)
end
```
