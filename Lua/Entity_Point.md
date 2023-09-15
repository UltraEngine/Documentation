# Entity:Point

This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax

- **Point**([Entity](Entity.md) entity, number axis = 2, number rate = 1, number roll = 0) 
- **Point**(number x, number y, number z, number axis = 2, number rate = 1, number roll = 0) 
- **Point**([xVec3](xVec3.md) position, number axis = 2, number rate = 1, number roll = 0) 

| Parameter | Description |
| --- | --- |
| entity | entity to point to |
| position, (x, y, z) | position in space to point to |
| axis | axis to align (0, 1, or 2) | 
| rate | can be used to gradually align the entity | 
| roll | rotation around the axis |
