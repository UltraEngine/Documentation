```lua
function Model:Clear()
```

## Description

This method is used to remove all meshes from the model. After calling this method, the model will have only a single empty level of detail.

## Example

```lua
local model = Model()

-- Add meshes to the model

model:Clear()

-- The model is now empty
```