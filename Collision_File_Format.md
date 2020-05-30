# Collision File Format ##
The PHY collision shape format is a JSON-based ASCII format. PHY files consist of one top-level *collision* object that contains an array of shapes. Each shape has a type, offset, rotation, and size attributes.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "BOX",
                "offset": [0,0,0],
                "rotation": [0,0,0],
                "size": [1,1,1]
            }
        ]
    }
}
```
Supported shapes include "BOX", "CONE", "CYLINDER", "SPHERE", "CONVEX_HULL", and "MESH". In the case of cylinders and cones, the z parameter of the size array will be ignored and can be ommitted.
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
In the case of spheres, a single numerical value is used. Note that in all cases, size indicates diameter, not radius.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "SPHERE",
                "size": 1
            }
        ]
    }
}
```

Shapes of type CONVEX_HULL should include an array of vertex positions that is evenly divisible by three:
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "vertices": [-0.5,0.5,0.5,0.5,0.5,0.5,0.5,-0.5,-0.5,-0.5,-0.5,0.5]
            }
        ]
    }
}
```

Shapes of type MESH should include an array of faces.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "faces":
                [
                    {
                        "vertices": [0,0,0]
                    },
                    {
                        "vertices": [1,0,0]
                    },
                    {
                        "vertices": [1,0,1]
                    }
                ]
            }
        ]
    }
}
```
