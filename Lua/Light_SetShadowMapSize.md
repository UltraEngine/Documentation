# Light:SetShadowMapSize

This function is used to control the resolution of a light's shadow map.

## Syntax

```lua
function Light:SetShadowMapSize(size)
```

## Parameters

- `size` : power-of-two texture size

## Example

```lua
local light = Light()

light:SetShadowMapSize(1024)
```