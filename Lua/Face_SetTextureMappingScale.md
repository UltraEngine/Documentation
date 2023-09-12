# Face:SetTextureMappingScale

This method manually sets the face texture mapping planes, overriding the default brush texture mapping routine.

## Syntax

```lua
function Face:SetTextureMappingScale(x, y)
```

### Parameters

| Name | Description |
|---|---|
| x | Horizontal texture scale |
| y | Vertical texture scale |

## Example

```lua
-- Create a new Face object
local face = Face()

-- Set the texture mapping scale
face:SetTextureMappingScale(2.0, 1.5)
```

In this example, we create a new `Face` object and then set the texture mapping scale to 2.0 horizontally and 1.5 vertically.