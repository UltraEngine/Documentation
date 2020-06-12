# ConvexHull #
This class provides an interface for building and using convex hull geometric objects. These objects are not visible but can be used to build other visible objects such as [brushes](CPP_Brush.md).

## Members ##
- AABB bounds
- vector<shared_ptr<Edge> > edges
- vector<shared_ptr<Face> > faces
- vector<Vec3> vertices

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
- CreateConvexHull
