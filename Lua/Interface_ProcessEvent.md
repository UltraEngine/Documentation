# ProcessEvent

This function sends an event to an interface to be evaluated.

```lua
function Interface:ProcessEvent(ev)
    -- code to evaluate the event
end
```

## Parameters

- `ev` (Event): event to be evaluated

## Remarks

When an interface is created directly on a window, it will automatically receive events from the window. However, when an interface is created to appear in a 3D rendering viewport, events must be manually sent to the interfaces. This allows the user to make changes to events. For example, the coordinates of a mouse event can be transformed from 3D space to coordinates on a panel in the 3D world.

## Example

```lua
Interface = {}

function Interface:CreateInterface()
    -- create interface
end

function Interface:CreateButton()
    -- create button
end

function Interface:ProcessEvent()
    -- process event
end

-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0])

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Load a font
local font = LoadFont("Fonts/arial.ttf")

-- Create user interface
local ui = Interface:CreateInterface(world, font, framebuffer.size)

-- Create widget
local sz = ui.root:ClientSize()
local button = Interface:CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root)

-- Create camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetPosition(framebuffer.size.x / 2, framebuffer.size.y / 2, 0)

while true do
    while PeekEvent() do
        local ev = WaitEvent()
        if ev.id == EVENT_WINDOWCLOSE and ev.source == window then
            return 0
        else
            ui:ProcessEvent(ev)
        end
    end
    
    world:Update()
    world:Render(framebuffer)
end

return 0
```