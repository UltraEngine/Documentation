# Brush

Base class: [Entity](Entity.md)

This class provides an interface for building level geometry with constructive solid geometry.

| Property | Type | Description |
|---|---|---|
| faces | const List<shared_ptr<[Face](Face.md)\>> | read-only array of faces |
| [AddFace](Brush_AddFace.md) | Method | adds a new face to the brush | 
| [AddVertex](Brush_AddVertex.md) | Method | add a new vertex to the brush | 
| [Build](Brush_Build.md) | Method | updates texture mapping, physics collider, and visible meshes | 
| [IntersectsBrush](Brush_IntersectsBrush.md) | Method | brush-brush intersection test | 
| [IntersectsPoint](Brush_IntersectsPoint.md) | Method | brush-point intersection test | 
| [SetVertexPosition](Brush_SetVertexPosition.md) | Method | moves a brush vertex | 
| [Slice](Brush_Slice.md) | Method | slices the brush along a plane | 
| [CreateBoxBrush](CreateBoxBrush.md) | Function | creates a new box brush |
| [CreateBrush](CreateBrush.md) | Function | creates a new brush entity | 

```csharp
// Example
Brush brush = CreateBrush();
brush.AddVertex(Vector3.zero);
brush.AddVertex(new Vector3(1, 0, 0));
brush.AddVertex(new Vector3(0, 1, 0));
brush.AddFace(new Face(0, 1, 2));
brush.Build();
```