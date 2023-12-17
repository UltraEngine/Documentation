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

-- Parse command line arguments
local cl = ParseCommandLine(arg)

-- Load FreeImage plugin (optional)
local fiplugin = LoadPlugin("Plugins/FITextureLoader")

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[1].scale, 720 * displays[1].scale, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a world
local world = CreateWorld()

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Load the map
local mapname = "Maps/start.ultra"
if cl["map"] and type(cl["map"]) == "string" then
    mapname = cl["map"]
end
local scene = LoadMap(world, mapname)

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
    Steamworks.Update()
end

-- Shutdown Steamworks
Steamworks.Shutdown()
```
