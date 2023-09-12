# Component:Update

This function is called once per call to [World:Update](World_Update.md).

## Syntax

`function Component:Update()`

## Remarks

You can override this function to add your own custom behavior that is updated each frame. The base Update function only removes the component from the update list, so there is no need to call it yourself. In other words, don't do this:
```lua
function MyComponent:Update()
  Component.Update(self)
end
```