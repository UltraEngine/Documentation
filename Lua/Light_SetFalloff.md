# Light:SetFalloff

This method sets the light falloff mode, to control the way light fades with distance.

## Syntax

```lua
function Light:SetFalloff(falloff)
```

### Parameters

- `falloff` (LightFalloffMode): light falloff mode, can be `LIGHTFALLOFF_LINEAR` or `LIGHTFALLOFF_INVERSE_SQUARE`