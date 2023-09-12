# camera:setDepthPrepass

This method enables or disables early Z-pass for the camera.

## Syntax

```lua
camera:setDepthPrepass(mode)
```

## Parameters

- `mode` (boolean): If set to true, early Z pass will be enabled.

## Remarks

By default, Ultra Engine will render the depth only in a pre-pass before final rendering. This ensures that expensive lighting calculations are only performed on unoccluded pixels. However, in vertex-heavy scenes or scenes with heavy tessellation, it can be faster to disable the camera depth pre-pass with this method.

Disabling the depth prepass can also be useful when debugging tessellation shaders or other shaders that alter vertex positions.