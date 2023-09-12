# Mesh:Recenter

Recenters a mesh along one or more axes.

## Syntax

```lua
function Mesh:Recenter(x, y, z)
```

## Parameters

- `x` (boolean): If set to `true`, the mesh will be recentered along the x-axis.
- `y` (boolean): If set to `true`, the mesh will be recentered along the y-axis.
- `z` (boolean): If set to `true`, the mesh will be recentered along the z-axis.

## Example

```lua
-- Assuming 'mesh' is an instance of the 'Mesh' class

-- Recenter the mesh along all axes
mesh:Recenter(true, true, true)

-- Recenter the mesh only along the y-axis
mesh:Recenter(false, true, false)
```