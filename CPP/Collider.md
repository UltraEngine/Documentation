# Collider

**Base class:** [Asset](Asset.md)

This class provides an interface for loading and creating collision shapes for physics interactions.

| Property | Type | Description |
| ----- | ----- | ----- |
| [CreateBoxCollider](CreateCollisionBox_FP.md) | Function | Creates a box collision shape for physics interactions. |
| [CreateCompoundCollider](CreateCollisionCompound.md) | Function | Creates a compound collision shape for physics interactions. |
| [CreateConeCollider](CreateCollisionCone_FP.md) | Function | Creates a cone collision shape for physics interactions. |
| [CreateCylinderCollider](CreateCollisionCylinder_32f.md) | Function | Creates a cylinder collision shape for physics interactions. |
| [CreateConvexHullCollider](CreateCollisionConvexHull.md) | Function | Creates a convex hull collision shape for physics interactions. |
| [CreateMeshCollider](CreateCollisionMesh.md) | Function | Creates a mesh collision shape for physics interactions. |
| [CreateSphereCollider](CreateCollisionSphere_32f.md) | Function | Creates a sphere collision shape for physics interactions. |
| [LoadCollider](LoadCollider.md) | Function | Loads a collision shape from a file |

## JSON File Structure

The collider file format is a JSON-based ASCII format. PHY files consist of one top-level *collision* object that contains an array of shapes.

Each shape can specify any of the following attributes:

| Name | Type | Elements | Description |
|---|---|---| --- |
| **shape** | string | - | may be BOX, CONE, CYLINDER, SPHERE, CONVEX_HULL, or MESH |
| **size** | number array | 1, 2, or 3 | scale / diameter |
| **offset** | number array | 3 | position |
| **rotation** | number array | 3 | Euler rotation | 
| **vertices** | number array | (3 or 9) * n | convex hull points or mesh vertices |

The file below specifies a box shape with dimensions of 1.0 on each axis, positioned at its center, with zero rotation:
```json
{
    "collider":
    {
        "subShapes":
        [
            {
                "shape": "BOX",
                "size": [1.0, 1.0, 1.0],
                "offset": [0.0, 0.0, 0.0],
                "rotation": [0.0, 0.0, 0.0]
            }
        ]
    }
}
```
Supported shapes include BOX, CONE, CYLINDER, SPHERE, CONVEX_HULL, and MESH. In the case of cylinders and cones, the z parameter of the size array will be ignored and can be omitted. The file below creates a cylinder with a diamater of 1.0 and a height of 3.0:

```json
{
    "collider":
    {
        "subShapes":
        [
            {
                "shape": "CYLINDER",
                "size": [1.0, 3.0]
            }
        ]
    }
}
```

In the case of spheres, an array with length one can be used. Note that in all cases, size indicates diameter, not radius.

```json
{
    "collider":
    {
        "subShapes":
        [
            {
                "shape": "SPHERE",
                "size": [1.0]
            }
        ]
    }
}
```

Shapes of type CONVEX_HULL and MESH should include an array of vertex positions. If the shape is a convex hull the array must be evenly divisible by three. If the shape is a mesh the array must be evenly divisible by nine. These types of shapes do not support offset, size, or rotation values.

```json
{
    "collider":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "vertices": [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 1.0]
            }
        ]
    }
}
```

Also note that mesh shapes can not be physically active. They can be collided against, but an entity with a mesh collision applied to it will not be affected by forces and will not move.

For more complex shapes, compound collisions can be built from multiple subshapes of any type.

```json
{
	"collider":
	{
		"subShapes":
		[
			{
				"shape": "SPHERE",
				"size": [2.0, 2.0, 2.0],
				"offset": [0.0, 0.0, 0.0],
				"rotation": [0.0, 0.0, 0.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [1.0, 0.0, 0.0],
				"rotation": [0.0, 0.0, -90.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [-1.0, 0.0, 0.0],
				"rotation": [0.0, 0.0, 90.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [0.0, 1.0, 0.0],
				"rotation": [0.0, 0.0, 0.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [0.0, -1.0, 0.0],
				"rotation": [180.0, 0.0, 0.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [0.0, 0.0, 1.0],
				"rotation": [90.0, 0.0, 0.0]
			},
			{
				"shape": "CONE",
				"size": [1.0, 1.0, 1.0],
				"offset": [0.0, 0.0, -1.0],
				"rotation": [-90.0, 0.0, 0.0]
			}
		]
	}
}
```
