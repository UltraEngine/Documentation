# Face::SetTextureMappingScale

THis method manually sets the face texture mapping planes, overriding the default brush texture mapping routine.

## Syntax

- void **SetTextureMappingScale**(const float x, const float y)

| Parameter | Description |
|---|---|
| x, y | texture mapping scale to set, in texels per meter |

# Remarks

The default brush texture mapping scale is 400, meaning that 400 pixels cover an area of one meter. With this scaling factor, a 1024 x 1024 texture will cover a 256 x 256 centimeter area.
