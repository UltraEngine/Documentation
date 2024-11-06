# Object:As

This function does not exist in the Lua API. Instead, use the class name as a function to cast an object:

```lua
local model = CreateBox(nil)
local entity = Entity(model)
model = Model(entity)
```
