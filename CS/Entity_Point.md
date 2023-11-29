# Entity.Point

This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax

- void **Point**(Entity entity, int axis = 2, float rate = 1, float roll = 0)
- void **Point**(float x, float y, float z, int axis = 2, float rate = 1, float roll = 0)
- void **Point**(xVec3 position, int axis = 2, float rate = 1, float roll = 0)

| Parameter | Description |
| --- | --- |
| entity | entity to point to |
| position, (x, y, z) | position in space to point to |
| axis | axis to align (0, 1, or 2) | 
| rate | can be used to gradually align the entity | 
| roll | rotation around the axis |