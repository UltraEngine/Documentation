## Lua: Face:SetTextureMappingTranslation

This method manually sets the face texture mapping planes, overriding the default brush texture mapping routine.

### Syntax

```lua
function Face:SetTextureMappingTranslation(x, y)
```

#### Parameters

| Parameter | Description |
|---|---|
| x | Horizontal texture offset |
| y | Vertical texture offset |

### Example

```lua
-- Create a face object
local face = Face()

-- Set the texture mapping translation
face:SetTextureMappingTranslation(0.5, -0.3)
```

In this example, we create a new `Face` object and then use the `SetTextureMappingTranslation` method to set the horizontal texture offset as `0.5` and the vertical texture offset as `-0.3`.