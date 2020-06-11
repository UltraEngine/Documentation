# Entity::Point #
This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax ##
- void **Point**(shared_ptr<[Entity](CPP_Entity.md)\> entity, const int axis = 2, const float rate = 1.0, const float roll = 0.0) 
- void **Point**(const float x, const float y, const float z, const int axis = 2, const float rate = 1.0, const float roll = 0.0) 
- void **Point**(const [Vec3](CPP_Entity.md)& position, const int axis = 2, const float rate = 1.0, const float roll = 0.0) 

### Parameters ###
| Name | Description |
| --- | --- |
| **entity** | entity to point to |
| **x** | x component of the position to point to |
| **y** | y component of the position to point to |
| **z** | z component of the position to point to |
| **z** | position to point to |
| **axis** | axis to align (0, 1, or 2) | 
| **rate** | can be used to gradually align the entity | 
| **roll** | rotation around the axis |
