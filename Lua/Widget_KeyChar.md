# Widget:KeyChar

This method is called when a keyboard character is entered.

## Syntax

```lua
function Widget:KeyChar(keychar)
```

## Parameters

- `keychar` (number): ASCII character code for the inputted text.

## Remarks

This is a protected virtual method. It can only be used by declaring it in a custom widget.

Here is an example of how to implement the `Widget:KeyChar` method:

```lua
-- Define a custom widget
local MyWidget = {}

-- Implement the KeyChar method
function MyWidget:KeyChar(keychar)
    -- Add your implementation code here
end

-- Create an instance of the custom widget
local widget = MyWidget()

-- Call the KeyChar method on the widget
widget:KeyChar(65) -- Pass ASCII code for the character 'A'
```