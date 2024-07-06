# MeshLayer::SetHeightConstraints

This method sets the height constraints for the mesh layer. This affects the way the [MeshLayer::Fill](MeshLayer_Fill.md) method works.

## Syntax

- **SetHeightConstraints**(number minheight, number maxheight)

| Parameter | Description |
|---|---|
| minheight | instances will not appear below this height |
| maxheight | instances will not appear above this height |

## Comments

The value NAN can be used to disable one or both constraints.

By default height constraints are disabled.
