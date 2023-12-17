# Update

Namespace: [Steamworks](Steamworks.md)

This function should be called once per frame when a Steam app is running.

## Syntax

- **Update**()

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

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
    Steamworks.Update()
end

-- Shutdown Steamworks
Steamworks.Shutdown()
```
