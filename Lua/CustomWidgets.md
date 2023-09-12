# Custom Widgets

You can create new types of widgets in Lua by extending the base [Widget](Widget.md) class. The widget's behavior is controlled by overriding the Widget class methods. Drawing is accomplished by adding WidgetBlock objects to the blocks member.

The following methods can be overridden to control custom widget behavior:

| Name | Description |
|---|---|
| [Draw](Widget_Draw.md) | called each time the widget is painted |
| [DoubleClick](Widget_DoubleClick.md) | called when a mouse button is clicked twice in rapid succession |
| [GainFocus](Widget_GainFocus.md) | called when the widget is selected |
| [KeyChar](Widget_KeyChar.md) | called when a keyboard character is entered |
| [KeyDown](Widget_KeyDown.md) | called when a keyboard key is pressed |
| [KeyUp](Widget_KeyUp.md) | called when a keyboard key is released |
| [LoseFocus](Widget_LoseFocus.md) | called when the widget is deselected |
| [MouseDown](Widget_MouseDown.md) | called when a mouse button is pressed |
| [MouseEnter](Widget_MouseEnter.md) | called when the mouse cursor enters the active window bounds |
| [MouseLeave](Widget_MouseLeave.md) | called when the mouse cursor leaves the active window bounds |
| [MouseMove](Widget_MouseMove.md) | called whenever the mouse moves, with coordinates relative to the active window |
| [MouseUp](Widget_MouseUp.md) | called when a mouse button is released |
| [MouseWheel](Widget_MouseWheel.md) | called when the mouse wheel turns |
| [TripleClick](Widget_TripleClick.md) | called when a mouse button is clicked rapidly three times |

## Example

```lua
--Declare new widget class
CustomWidget = {}
CustomWidget.__index = CustomWidget

--Constructor
function CustomWidget.new()
    local self = setmetatable({}, CustomWidget)
    self.hover = false
    return self
end

--Called when the mouse moves if this widget has the focus
function CustomWidget:MouseMove(x, y)
end

--Called when the mouse cursor enters the widget bounds
function CustomWidget:MouseEnter(x, y)
    self.hover = true
    self:Redraw()
end

--Called when the mouse cursor leaves the widget bounds
function CustomWidget:MouseLeave(x, y)
    self.hover = false
    self:Redraw()
end

--Called when the mouse button is pressed
function CustomWidget:MouseDown(button, x, y)
    if button == MOUSE_LEFT then
        EmitEvent(EVENT_WIDGETACTION, self)
    end
end

--Called when the mouse button is released
function CustomWidget:MouseUp(button, x, y)
end

--Called when another widget becomes selected
function CustomWidget:LoseFocus()
end

--Called when mouse double-click occurs
function CustomWidget:DoubleClick(button, x, y)
end

--Called when mouse triple-click occurs
function CustomWidget:TripleClick(button, x, y)
end

--Called when widget is selected
function CustomWidget:GainFocus()
end

--Called when a key is pressed
function CustomWidget:KeyDown(key)
end

--Called when a key is released
function CustomWidget:KeyUp(key)
end

--Called for each keydown event
function CustomWidget:KeyChar(keychar)
end

--Called when the mouse wheel turns and the mouse is hovered over this widget
function CustomWidget:MouseWheel(delta, x, y)
end

--Called each time the widget is redrawn
function CustomWidget:Draw(x, y, width, height)
    self.blocks = {}
    local color = Vec4(1, 0, 0, 1)
    if self.hover then
        color = Vec4(0, 1, 0, 1)
    end

    --Background rectangle
    table.insert(self.blocks, { position = iVec2(0), size = self.size, color = color })

    --Foreground text
    table.insert(self.blocks, { text = self.text, position = iVec2(0), size = self.size, color = Vec4(1), flags = TEXT_CENTER | TEXT_MIDDLE })
end

--Create function
function CreateCustomWidget(text, x, y, width, height, parent, style)
    local widget = CustomWidget.new()
    widget:Initialize(text, x, y, width, height, parent, style)
    return widget
end

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local widget = CreateCustomWidget("Custom", 20, 20, 120, 36, ui.root, CUSTOMWIDGET_DEFAULT)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        Print("Widget action: " .. tostring(ev.data))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```