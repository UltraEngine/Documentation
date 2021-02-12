# ConvexHull #
This class provides an interface for building and using convex hull geometric objects. These objects are not visible but can be used to build other visible objects such as [brushes](Brush.md).

## Members ##
- [AABB](AABB.md) bounds
- vector<shared_ptr<[Edge](Edge.md)\> \> edges
- vector<shared_ptr<[Face](Face.md)\> \> faces
- vector<[Vec3](Vec3.md)\> vertices

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
- [CreateConvexHull](CreateConvexHull.md)