# Brush #
The brush class provides an interface for building level geometry with constructive solid geometry modeling.

## Members ##
- shared_ptr<[ConvexHull](CPP_ConvexHull_32f.md)\> convexhull
- vector<shared_ptr<[Face](CPP_Face.md)\> \>& faces
- vector<shared_ptr<[Mesh](CPP_Mesh.md)\> \>& meshes

## Methods ##
- AddFace
- AddVertex
- Build
- Center
- ShiftTextureMapping

## Functions ##
- CreateBrush
