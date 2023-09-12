# Face:SetMaterial

This method applies a material to a face.

## Syntax

```lua
function Face:SetMaterial(material)
```

## Parameters

- `material` (type: [Material](Material.md)): The material to assign.

## Remarks

Before the material will appear on the visible mesh, you must call [Brush:Build](Brush_Build.md).