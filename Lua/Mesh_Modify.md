# Mesh:Modify

This function performs a batch modification of mesh data.

## Syntax

- void **Modify**(vertices)
- void **Modify**(indices)

## Parameters

- **vertices**: A table representing a vertex array to set.
- **indices**: A table representing an indice array to set.

## Remarks

The size of the vertex or indice array must be less than or equal to the number of mesh vertices or indices.

If the indice array size is less than the number of mesh indices, the remaining indices will be set to 0.

### Example

```lua
-- Creating a mesh object
local mesh = Mesh()

-- Defining a vertex array
local vertices = {
  Vertex(position, normal, texcoord),
  Vertex(position, normal, texcoord),
  -- more vertices...
}

-- Modifying the mesh with the vertex array
mesh:Modify(vertices)

-- Defining an indice array
local indices = { 1, 2, 3, 4, 5 }

-- Modifying the mesh with the indice array
mesh:Modify(indices)
```