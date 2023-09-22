# CreateInterface

This function creates a new graphical user interface for desktop applications or in-game interfaces.

## Syntax

[Interface](Interface.md) **CreateInterface**([Window](Window.md) window) <br>
[Interface](Interface.md) **CreateInterface**([World](World.md) world, [Font](Font.md) font, [iVec2](iVec2.md) size)

| Parameter | Description |
| --- | --- |
| window | window to create the user interface on |
| world | world to create the interface in, for 3D graphics |
| font | font to use, for 3D graphics |
| size | interface dimensions, for 3D graphics |

## Returns

Returns a new interface object.

## Example

Four examples are shown below to demonstrate different types of programs you can create.

The first example shows how to create an interface directly on a window for an event-based desktop application.

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1])

--Create user interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.background:ClientSize()
local button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.background)

while (true) do
    local ev = WaitEvent()
    if (ev.id == EVENT_WINDOWCLOSE and ev.source == window) then
        return 0
    end
end
```

The second example shows how to create an interface that appears in a 3D rendering viewport. Note that in this example you must send events to the interface with the `ProcessEvent` method.

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1])

--Create framebuffer
local framebuffer = CreateFramebuffer(window)

--Create world
local world = CreateWorld()

--Load a font
local font = LoadFont("Fonts/arial.ttf")

--Create user interface
local ui = CreateInterface(world, font, framebuffer.size)

--Create widget
local sz = ui.background:ClientSize()
local button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.background)

--Create camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetPosition(framebuffer.size.x * 0.5, framebuffer.size.y * 0.5, 0)

while not window:KeyDown(KEY_ESCAPE) do
    while (PeekEvent()) do
        local ev = WaitEvent()
        if (ev.id == EVENT_WINDOWCLOSE and ev.source == window) then
            return 0
        else
            ui:ProcessEvent(ev)
        end
    end

    world:Update()
    world:Render(framebuffer)
end
```

The third example shows how to create an event-driven desktop application with a 3D viewport embedded in the interface.

```lua
-- Constants
local SidePanelWidth = 200
local Indent = 8

-- Callback function for resizing the viewport
local function ResizeViewport(ev, extra)
    -- If the window resize event is captured
    local window = ev.source:AsWindow()

    -- Get the new size of the applications window
    local sz = window:ClientSize()

    local viewport = extra:AsWindow()

    -- Set the position and size of the viewport window
    viewport:SetShape(SidePanelWidth, Indent, sz.x - SidePanelWidth - Indent, sz.y - Indent * 2)

    return true
end

-- Initialize Engine
local settings = EngineSettings()
settings.asyncrender = false
Initialize(settings)

-- Get the available displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER + WINDOW_TITLEBAR + WINDOW_RESIZABLE)

-- Create user interface
local ui = CreateInterface(window)

-- Get the size of the user interface
local sz = ui.background:ClientSize()

-- Create a treeview widget
local treeview = CreateTreeView(Indent, Indent, SidePanelWidth - Indent * 2, sz.y - Indent * 2, ui.root)

-- Anchor left, top, and bottom of treeview widget
treeview:SetLayout(1, 0, 1, 1)

-- Add nodes to the treeview widget
treeview.root:AddNode("Object 1")
treeview.root:AddNode("Object 2")
treeview.root:AddNode("Object 3")

-- Create a viewport window
local viewport = CreateWindow("", SidePanelWidth, Indent, sz.x - SidePanelWidth - Indent, sz.y - Indent * 2, window, WINDOW_CHILD)

-- Adjust the size of the viewport when the applications window is resized (this will callback to our ResizeViewport() function)
ListenEvent(EVENT_WINDOWSIZE, window, ResizeViewport, viewport)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(viewport)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -4)

-- Create a light
local light = CreateBoxLight(world)
light:SetRotation(35, 45, 0)
light:SetRange(-10, 10)

-- Create a model
local model = CreateSphere(world)
model:SetColor(0, 0, 1)

-- This variable will be used for viewport refreshing
local dirty = false

-- Main loop
while (true) do
    -- Wait for event
    local ev = WaitEvent()

    -- Evaluate event
    if (ev.id == EVENT_WINDOWMOVE) then
        Print("Window move")
        if (not dirty) then
            dirty = true
            EmitEvent(EVENT_VIEWPORTRENDER, viewport)
            Print("viewport refresh")
        end
    elseif (ev.id == EVENT_WINDOWSIZE) then
        Print("Window size")
        if (not dirty) then
            dirty = true
            EmitEvent(EVENT_VIEWPORTRENDER, viewport)
            Print("viewport refresh")
        end
    elseif (ev.id == EVENT_KEYDOWN) then
        if (ev.source == window and ev.data == KEY_ESCAPE) then
            return 0
        end
    elseif (ev.id == EVENT_WINDOWCLOSE) then
        if (ev.source == window) then
            return 0
        end
    elseif (ev.id == EVENT_WINDOWPAINT) then
        Print("Window paint")
        if (not dirty) then
            -- This prevents excessive paint events from building up, especially during window resizing
            -- This event is added to the end of the event queue, so if a lot of paint events build up, it will 
            -- only cause a single render to be performed.
            dirty = true
            EmitEvent(EVENT_VIEWPORTRENDER, viewport)
            Print("viewport refresh
