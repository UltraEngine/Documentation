# MeshLayer:SetSlopeConstraints

This method sets the height constraints for the mesh layer. This affects the way the [MeshLayer::Fill](MeshLayer_Fill.md) method works.

## Syntax

- **SetSlopeConstraints**(number minslope, number maxslope)

| Parameter | Description |
|---|---|
| minslope | instances will not appear below this height |
| maxslope | instances will not appear above this height |

## Comments

The value NAN can be used to disable one or both constraints.

The default min and max slope are 0 and 90.
