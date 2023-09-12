# Widget:MouseUp

This method is called when a mouse button is released.

**Syntax:**
```lua
function Widget:MouseUp(button, x, y)
```

**Parameters:**

- `button` (number): the mouse button released, can be `MOUSE_LEFT`, `MOUSE_RIGHT`, or `MOUSE_MIDDLE`
- `x` (number): the mouse x screen coordinate
- `y` (number): the mouse y screen coordinate

**Remarks:**

This is a protected virtual method. It can only be used by declaring it in a custom widget.

## Example

```lua
-- Create a custom widget
local MyWidget = {}
MyWidget.__index = MyWidget

function MyWidget:Create()
    local widget = {}
    setmetatable(widget, MyWidget)
    return widget
end

-- Implement the MouseUp method
function MyWidget:MouseUp(button, x, y)
    -- Add your custom logic here
    print("MouseUp event received: button = ", button, ", x = ", x, ", y = ", y)
end

-- Usage example
local myWidget = MyWidget:Create()
myWidget:MouseUp(MOUSE_LEFT, 100, 200)
```

In the above example, we define a custom widget `MyWidget` and implement the `MouseUp` method. When the `MouseUp` event is triggered, the custom logic inside the method will be executed. Finally, we create an instance of `MyWidget` and call the `MouseUp` method with some sample values to test the event handling.