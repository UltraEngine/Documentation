# Material::SetTransparent

This method sets the transparency mode of the material.

## Syntax

- void **SetTransparent**(const bool transparent)

| Parameter | Description |
|---|---|
| transparent | true for transparent materials, false for opaque |

## Remarks

Transparent materials are automatically drawn after opaque materials. However, the order transparent materials are drawn in will be random unless Z-sorting is enabled with the [Material::SetZSort](Material_SetZSort.md) command. Note that Z-sorted objects will render more slowly.

Transparent materials do not write anything to the depth buffer.
