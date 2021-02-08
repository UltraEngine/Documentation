# ConvexHull #
This class provides an interface for building and using convex hull geometric objects. These objects are not visible but can be used to build other visible objects such as [brushes](CPP_Brush.md).

## Members ##
- [AABB](CPP_AABB.md) bounds
- vector<shared_ptr<[Edge](CPP_Edge.md)\> \> edges
- vector<shared_ptr<[Face](CPP_Face.md)\> \> faces
- vector<[Vec3](CPP_Vec3.md)\> vertices

## Methods ##
- Build
- BuildBounds
- BuildEdges
- BuildPlanes
- BuildTexCoords
- IntersectsAABB
- IntersectsConvexHull
- IntersectsPlane
- IntersectsPoint

## Functions ##
- [CreateConvexHull](CPP_CreateConvexHull.md)
