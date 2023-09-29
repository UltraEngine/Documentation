# Map:Reload

This method reloads the states of the entities in a scene from a file, without recreating them. This is useful for loading game save states or synchonizing the world over a network.

## Syntax

- boolean **Reload**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path, number flags = LOAD_DEFAULT)
- boolean **Reload**([Stream](Stream.md) stream, number flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to read |
| stream | JSON data to read |
| binstream | binary data to read |
| flags | optional load flags |

## Returns

Returns true of the scene was successfully reloaded, otherwise false is returned.

## Remarks

This method can be faster than [LoadScene](LoadScene.md) because it does not create any new objects. It may be able to handle scenes that been updated since the saved scene was created. For example if additional objects have been added to the scene since it was last saved, they will remain unchanged when the scene state is reloaded.

This feature is in continued development and its behavior may change somewhat in future updates.

## Example

This example saves the starting scene to memory and reloads the scene entity states when the space key is pressed.

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 1, -4)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetArea(15, 15)
light:SetRotation(45, 35, 0)
light:SetColor(2)

-- Create the ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

-- Create a scene
local scene = CreateMap()

-- Add some boxes
for n = 1, 10 do
    local box = CreateBox(world)
    box:SetColor(0, 0, 1)
    box:SetPosition(Random(-5, 5), Random(5, 10), Random(-5, 5))
    box:SetMass(1)
    scene.entities[#scene.entities + 1] = box
end

-- Save the starting scene to memory
local stream = CreateBufferStream()
local binstream = CreateBufferStream()
scene:Save(stream, binstream)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do

    -- Reload the starting scene when space key is pressed
    if window:KeyHit(KEY_SPACE) then
        stream:Seek(0)
        binstream:Seek(0)
        scene:Reload(stream, binstream)
    end

    world:Update()
    world:Render(framebuffer)
end
```
