# Entity::Point

This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax

- void **Point**(shared_ptr<[Entity](Entity.md)\> entity, const int axis = 2, const dFloat rate = 1.0, const dFloat roll = 0.0) 
- void **Point**(const dFloat x, const dFloat y, const dFloat z, const int axis = 2, const dFloat rate = 1.0, const dFloat roll = 0.0) 
- void **Point**(const [xVec3](xVec3.md)& position, const int axis = 2, const dFloat rate = 1.0, const dFloat roll = 0.0) 

| Parameter | Description |
| --- | --- |
| **entity** | entity to point to |
| **x** | X component of the position to point to |
| **y** | Y component of the position to point to |
| **z** | Z component of the position to point to |
| **z** | position to point to |
| **axis** | axis to align (0, 1, or 2) | 
| **rate** | can be used to gradually align the entity | 
| **roll** | rotation around the axis |
