# `Widget:GetInterface`

This method returns the interface the widget was created in.

## Syntax
```lua
function Widget:GetInterface()
```

## Returns
- Returns the widget interface as a `shared_ptr` of [Interface](Interface.md), or `nil` if the interface has gone out of scope and been deleted.