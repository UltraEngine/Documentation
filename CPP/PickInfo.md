# PickInfo

This class contains information from the results of a ray cast.

| Property | Type | Description |
| ----- | ----- | ----- |
| entity | [Entity](Entity.md) | picked entity |
| face | [Face](Face.md) | picked face, for brushes |
| mesh | [Mesh](Mesh.md) | picked mesh, for models |
| meshlayer | int | index of picked mesh layer, or -1 |
| meshlayerinstance | [iVec2](iVec2.md) | picked mesh layer instance coordinate |
| normal | [xVec3](xVec3.md) | picked normal |
| polygon | uint32_t | picked polygon, for models |
| position | [xVec3](xVec3.md) | picked position |
| success | bool | true if anything is hit or false for nothing hit |
| texcoords | array<[Vec2](Vec2.md), 2> | picked texture coordinates, for brushes or models |
