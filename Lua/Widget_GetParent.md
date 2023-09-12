# Widget:GetParent #
This function retrieves the widget parent.

Syntax:
```lua
function Widget:GetParent()
```

Returns:
- [Widget](Widget.md) - The widget parent.

Example:
```lua
local parentWidget = widget:GetParent()
```

In this example, `widget` is an instance of the `Widget` class. The `GetParent` function is used to retrieve its parent widget. The returned value, `parentWidget`, will be an instance of the `Widget` class.