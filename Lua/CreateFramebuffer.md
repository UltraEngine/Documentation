# createFramebuffer

This function creates a new framebuffer object for 2D and 3D rendering.

```lua
function createFramebuffer(window)
```

## Parameters

- `window` (shared_ptr<[Window](Window.md)\>): window to create the framebuffer on

## Returns

Returns a new framebuffer object if one is successfully created, otherwise `nil` is returned.

## Remarks

A framebuffer cannot be created on a window that uses the WINDOW_RESIZABLE window style, unless the multi-threaded renderer is disabled by calling [AsyncRender](AsyncRender.md) prior to engine initialization.

## Example
  
```lua
require("UltraEngine")

function main(args, argc)
    --Get the displays
    local displays = GetDisplays()

    --Create a window
    local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

    --Create a framebuffer
    local framebuffer = createFramebuffer(window)

    --Create a world
    local world = CreateWorld()

    --Create a camera
    local camera = CreateCamera(world)
    camera:SetClearColor(0.125)

    --Main loop
    while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
        --Update world
        world:Update()

        --Render world
        world:Render(framebuffer, true)
    end
end 
```