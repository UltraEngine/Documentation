# Widget:SetTexture

This method applies a texture to the widget. Typically this is used to display the rendering output of a camera that is drawing to a texture using the [Camera:SetRenderTarget](Camera_SetRenderTarget.md) command.

## Syntax

- **SetTexture**(c[Texture](Texture.md) texture, number alignment = PIXMAP_CENTER)

| Parameter | Description |
|---|---|
| texture | texture to apply, or NULL |
| alignment | alignment mode, can be PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, PIXMAP_STRETCH, or PIXMAP_FIT |

## Remarks

This method will only work with a widget created in a 3D interface.

This method works by creating a "virtual" pixmap that stores no pixel data, and assigning it to the widget. If you retrieve this pixmap it will be incompatible with pixmap commands that read or write pixel data.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1])

-- Create framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create world
local world = CreateWorld()

-- Load a font
local font = LoadFont("Fonts/arial.ttf")

-- Create user interface
local ui = CreateInterface(world, font, framebuffer.size)

-- Create and position camera
local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
camera:SetPosition(framebuffer.size.x * 0.5, framebuffer.size.y * 0.5, 0)

-- Create a panel
local panel = CreatePanel(ui.background.size.x * 0.5 - 256, ui.background.size.y * 0.5 - 256, 512, 512, ui.background)

-- Load and assign a texture to the panel
local tex = LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds")
panel:SetTexture(tex)

while true do
    while PeekEvent() do
        local ev = WaitEvent()
        if ev.id == EVENT_KEYDOWN then
            if ev.data == KEY_ESCAPE then
                return 0
            end
        elseif ev.id == EVENT_WINDOWCLOSE then
            if ev.source == window then
                return 0
            end
        else
            ui:ProcessEvent(ev)
        end
    end

    world:Update()
    world:Render(framebuffer)
end
```
