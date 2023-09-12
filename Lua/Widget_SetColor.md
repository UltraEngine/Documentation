### widget:SetColor

This method sets a widget's color value.

#### Syntax

* **widget:SetColor**(r: number, g: number, b: number, a: number = 1.0, index: WidgetColor = WIDGETCOLOR_BACKGROUND): void
* **widget:SetColor**(color: [Vec4](Vec4.md), index: WidgetColor = WIDGETCOLOR_BACKGROUND): void

##### Parameters

| Parameter | Description |
| --- | --- |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| color | color to set |
| index | color index |

#### Remarks

The color index can be any of the following values:

* WIDGETCOLOR_BACKGROUND
* WIDGETCOLOR_SUNKEN
* WIDGETCOLOR_RAISED
* WIDGETCOLOR_BORDER
* WIDGETCOLOR_FOREGROUND
* WIDGETCOLOR_SELECTION
* WIDGETCOLOR_HIGHLIGHT
* WIDGETCOLOR_SELECTEDTEXT
* WIDGETCOLOR_SLIDERARROW
* WIDGETCOLOR_SLIDERTRACK
* WIDGETCOLOR_SLIDERTRACKHOVERED
* WIDGETCOLOR_MENUBORDER
* WIDGETCOLOR_POPUP

#### Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()

-- Create widget
local panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root)

-- Fade to black over ten seconds
panel:SetColor(0, 0, 0, 1, WIDGETCOLOR_BACKGROUND, 10000)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```