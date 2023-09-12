# Brush

Base class: Entity

This class provides an interface for building level geometry with constructive solid geometry.

| Property | Type | Description |
|---|---|---|
| faces | const table | read-only array of faces |
| [AddFace](#addface) | Method | adds a new face to the brush |
| [AddVertex](#addvertex) | Method | add a new vertex to the brush |
| [Build](#build) | Method | updates texture mapping, physics collider, and visible meshes |
| [IntersectsBrush](#intersectsbrush) | Method | brush-brush intersection test |
| [IntersectsPoint](#intersectspoint) | Method | brush-point intersection test |
| [SetVertexPosition](#setvertexposition) | Method | moves a brush vertex |
| [Slice](#slice) | Method | slices the brush along a plane |
| [CreateBoxBrush](#createboxbrush) | Function | creates a new box brush |
| [CreateBrush](#createbrush) | Function | creates a new brush entity |

## AddFace

```lua
function Brush:AddFace(vertices)
```

Adds a new face to the brush.

### Parameters
- `vertices` (table): A table of Vertex instances representing the vertices of the face.

## AddVertex

```lua
function Brush:AddVertex(position)
```

Adds a new vertex to the brush.

### Parameters
- `position` (table): A table of three numbers representing the position of the vertex.

## Build

```lua
function Brush:Build()
```

Updates texture mapping, physics collider, and visible meshes.

## IntersectsBrush

```lua
function Brush:IntersectsBrush(otherBrush)
```

Performs a brush-brush intersection test.

### Parameters
- `otherBrush` (Brush): Another brush entity to test intersection with.

## IntersectsPoint

```lua
function Brush:IntersectsPoint(point)
```

Performs a brush-point intersection test.

### Parameters
- `point` (table): A table of three numbers representing the position of the point.

## SetVertexPosition

```lua
function Brush:SetVertexPosition(index, position)
```

Moves a brush vertex.

### Parameters
- `index` (number): The index of the vertex to move.
- `position` (table): A table of three numbers representing the new position of the vertex.

## Slice

```lua
function Brush:Slice(plane)
```

Slices the brush along a plane.

### Parameters
- `plane` (table): A table representing the slicing plane. The table should have the following fields:
  - `origin` (table): A table of three numbers representing the origin of the plane.
  - `normal` (table): A table of three numbers representing the normal vector of the plane.

## CreateBoxBrush

```lua
function CreateBoxBrush(size)
```

Creates a new box brush.

### Parameters
- `size` (table): A table of three numbers representing the size of the box brush.

## CreateBrush

```lua
function CreateBrush()
```

Creates a new brush entity.