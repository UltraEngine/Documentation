# LoadAudioFilter

This function loads an audio filter from a file. Audio filters are stored in JSON files and can be found in the "Sound/Filters" directory of a new project.

## Syntax

- function **LoadAudioFilter**(path: string, flags: int) -> AudioFilter

| Parameter | Description |
|---|---|
| *path* | file path to load |
| *flags* | optional load flags |

### Returns

- (AudioFilter): The loaded audio filter if successful, otherwise `nil` is returned.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFov(70)
camera:SetPosition(0, 0, -3)
camera:Listen()

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(35, 45, 0)
light:SetRange(-10, 10)

-- Create a box
local box = CreateBox(world)
box:SetColor(0, 0, 1)

-- Sound
local sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav")
local speaker = CreateSpeaker(sound)
speaker:SetLooping(true)
speaker:SetPosition(box:GetPosition(true))
speaker:Play()
speaker:SetRange(10)

-- Main loop
while (not window:Closed()) and (not window:KeyDown(KEY_ESCAPE)) do
    -- Add filter when space key is pressed
    if window:KeyHit(KEY_SPACE) then
        local filter = LoadAudioFilter("https://raw.githubusercontent.com/UltraEngine/Assets/main/Sound/Filters/EAXReverb/SewerPipe.json")
        speaker:SetFilter(filter)
    end

    -- Move and turn with the arrow keys - best experienced with headphones
    if window:KeyDown(KEY_UP) then
        camera:Move(0, 0, 0.1)
    end
    if window:KeyDown(KEY_DOWN) then
        camera:Move(0, 0, -0.1)
    end
    if window:KeyDown(KEY_LEFT) then
        camera:Turn(0, -1, 0)
    end
    if window:KeyDown(KEY_RIGHT) then
        camera:Turn(0, 1, -0)
    end

    world:Update()
    world:Render(framebuffer)
end
```
