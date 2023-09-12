# CreateButton

The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected.

## Syntax

- `function CreateButton(text: string, x: number, y: number, width: number, height: number, parent: Widget, style: ButtonStyle = BUTTON_DEFAULT): Widget`

  *Parameters:*
  
  - `text`: widget text
  - `x`: widget x position
  - `y`: widget y position
  - `width`: widget width
  - `height`: widget height
  - `parent`: parent widget
  - `style`: optional button style, can be any combination of BUTTON_CANCEL, BUTTON_CHECKBOX, BUTTON_RADIO, BUTTON_OK, BUTTON_TOGGLE, and BUTTON_TOOLBAR.
  
  *Returns:*
  
  - Returns a new button object.

## Example

The first example creates an interface directly on a window.

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateButton.png)

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create User Interface
local ui = CreateInterface(window)

--Create buttons
local x = (window.ClientSize().x - 120) / 2
local y = 50
local sep = 40

local button = CreateButton("Button", x, y, 120, 30, ui.root)
y = y + sep

local toggle = CreateButton("Toggle", x, y, 120, 30, ui.root, BUTTON_TOGGLE)
y = y + sep

local toolbar = CreateButton("Toolbar", x, y, 120, 30, ui.root, BUTTON_TOOLBAR)
y = y + sep

local checkbox = CreateButton("Checkbox", x, y, 120, 30, ui.root, BUTTON_CHECKBOX)
y = y + sep

local radio1 = CreateButton("Option 1", x, y, 120, 30, ui.root, BUTTON_RADIO)
radio1.SetState(WIDGETSTATE_SELECTED)

y = y + sep
local radio2 = CreateButton("Option 2", x, y, 120, 30, ui.root, BUTTON_RADIO)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        Print(ev.source:As(Widget):text)
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```

The second example renders an interface in a Vulkan framebuffer.

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create framebuffer
local framebuffer = CreateFramebuffer(window)

--Create world
local world = CreateWorld()

--Create camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera.SetPosition(framebuffer.size.x * 0.5, framebuffer.size.y * 0.5)

--Load a font
local font = LoadFont("Fonts/arial.ttf")

--Create User Interface
local ui = CreateInterface(world, font, framebuffer.size)

--Create buttons
local x = (window.ClientSize().x - 120) / 2
local y = 50
local sep = 40

local button = CreateButton("Button", x, y, 120, 30, ui.root)
y = y + sep

local toggle = CreateButton("Toggle", x, y, 120, 30, ui.root, BUTTON_TOGGLE)
y = y + sep

local toolbar = CreateButton("Toolbar", x, y, 120, 30, ui.root, BUTTON_TOOLBAR)
y = y + sep

local checkbox = CreateButton("Checkbox", x, y, 120, 30, ui.root, BUTTON_CHECKBOX)
y = y + sep

local radio1 = CreateButton("Option 1", x, y, 120, 30, ui.root, BUTTON_RADIO)
radio1.SetState(WIDGETSTATE_SELECTED)

y = y + sep
local radio2 = CreateButton("Option 2", x, y, 120, 30, ui.root, BUTTON_RADIO)

while true do
    while PeekEvent() do
        local ev = WaitEvent()
        if ev.id == EVENT_WIDGETACTION then
            Print(ev.source:As(Widget):text)
        elseif ev.id == EVENT_WINDOWCLOSE then
            return 0
        end
        ui.ProcessEvent(ev)
    end
    world.Update()
    world.Render(framebuffer)
end
```