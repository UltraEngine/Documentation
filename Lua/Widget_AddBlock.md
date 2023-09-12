# Widget:AddBlock

This function adds a [WidgetBlock](WidgetBlock.md) to a custom widget, for displaying a rectangle, image, or text. Generally, this function will be called inside the Draw function of a custom class derived from the [Widget](Widget.md) class.

## Syntax

- **AddBlock**(position: [iVec2](#ivec2), size: [iVec2](#ivec2), color: [Vec4](#vec4) = [Vec4](#vec4)(0), wireframe: boolean = false, radius: number = 0.0, gradient: number = 1.0): number
- **AddBlock**(text: [WString](#wstring), position: [iVec2](#ivec2), size: [iVec2](#ivec2), color: [Vec4](#vec4), alignment: number = 0): number
- **AddBlock**(icon: [Icon](#icon), position: [iVec2](#ivec2), scale: number = 1.0, color: [Vec4](#vec4) = 1.0): number
- **AddBlock**(pixmap: [Pixmap](#pixmap), position: [iVec2](#ivec2), color: [Vec4](#vec4) = 1.0): number

## Parameters

- `position`: screen coordinates of the block within the widget.
- `size`: width and height of the block clipping region.
- `color`: block color.
- `wireframe`: if set to true a rectangle outline will be drawn, otherwise a filled rectangle is drawn.
- `radius`: for rounded rectangles, radius of the corners.
- `gradient`: color multiplier for vertical gradient.
- `text`: text to display.
- `alignment`: text alignment, can be any combination of `TEXT_LEFT`, `TEXT_CENTER`, or `TEXT_RIGHT` and `TEXT_TOP`, `TEXT_MIDDLE`, and `TEXT_BOTTOM`.
- `icon`: icon to display.
- `scale`: icon scale, independent from DPI scaling.
- `pixmap`: pixmap to display.

## Returns
Returns the index of the new widget block.

## Example

```lua
-- Declare new style constants
CustomWidgetStyle = {
    CUSTOMWIDGET_DEFAULT = 0
}

-- Declare new widget class
CustomWidget = Widget:New()

-- Called when the mouse cursor enters the widget bounds
function CustomWidget:MouseEnter(x, y)
    self.hover = true
    self:Redraw()
end

-- Called when the mouse cursor leaves the widget bounds
function CustomWidget:MouseLeave(x, y)
    self.hover = false
    self:Redraw()
end

-- Called when the mouse button is pressed
function CustomWidget:MouseDown(button, x, y)
    if (button == MOUSE_LEFT) then
        self:EmitEvent(EVENT_WIDGETACTION, self:Self())
    end
end

-- Called when the widget is redrawn
function CustomWidget:Draw(x, y, width, height)
    self.blocks = {}

    color = Vec4(1, 0, 0, 1)
    if (self.hover) then
        color = Vec4(0, 1, 0, 1)
    end

    -- Background rectangle
    self:AddBlock(iVec2(0), self.size, color)

    -- Foreground text
    self:AddBlock(self.text, iVec2(0), self.size, Vec4(1), TEXT_CENTER | TEXT_MIDDLE)
end

-- Create function
function CreateCustomWidget(text, x, y, width, height, parent, style)
    widget = CustomWidget:New()
    widget:Initialize(text, x, y, width, height, parent, style)
    return widget
end

-- Get the displays
displays = GetDisplays()

-- Create a window
window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create User Interface
ui = CreateInterface(window)

-- Create widget
widget = CreateCustomWidget("Custom", 20, 20, 120, 36, ui.root, CustomWidgetStyle.CUSTOMWIDGET_DEFAULT)

while (true) do
    ev = WaitEvent()
    if (ev.id == EVENT_WIDGETACTION) then
        Print("Widget action: " .. tostring(ev.data))
    elseif (ev.id == EVENT_WINDOWCLOSE) then
        return 0
    end
end
```
