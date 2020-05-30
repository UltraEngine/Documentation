# Collision File Format ##
The PHY collision shape format is a JSON-based ASCII format. PHY files consist of one top-level *collision* object that contains an array of shapes.

Each shape can specify any of the following attributes:

| Name | Type | Size | Description |
|---|---|---| --- |
| shape | string | - | may be BOX, CONE, CYLINDER, SPHERE, CONVEX_HULL, or MESH |
| size | number array | 1, 2, or 3 | scale / diameter |
| offset | number array | 3 | position |
| rotation | number array | 3 | Euler rotation | 
| vertices | number array | 3 * n or 9 * n | convex hull points or mesh vertices |

The file below specifies a box shape with dimensions of 1.0 on each axis, positioned at its center, with zero rotation:
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "BOX",
                "size": [1,1,1],
                "offset": [0,0,0],
                "rotation": [0,0,0]
            }
        ]
    }
}
```
Supported shapes include "BOX", "CONE", "CYLINDER", "SPHERE", "CONVEX_HULL", and "MESH". In the case of cylinders and cones, the z parameter of the size array will be ignored and can be omitted.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CYLINDER",
                "size": [1,1]
            }
        ]
    }
}
```
In the case of spheres, an array with length one can be used. Note that in all cases, size indicates diameter, not radius.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "SPHERE",
                "size": [1]
            }
        ]
    }
}
```

Shapes of type CONVEX_HULL and MESH should include an array of vertex positions. If the shape is a convex hull the array must be evenly divisible by three. If the shape is a mesh the array must be evenly divisible by nine. These types of shapes do not support offset, size, or rotation values.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "vertices": [0,0,0,1,0,0,0,1,0,1,1,1]
            }
        ]
    }
}
```
Compound collision shapes can be built from multiple subshapes of any type.
```json
{
	"collision":
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
