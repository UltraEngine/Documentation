# Entity::Point #
This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax ##
- void **Point**(shared_ptr<[Entity](CPP_Entity_32f.md)\> entity, const int axis = 2, const float rate = 1.0, const double roll = 0.0) 
- void **Point**(const double x, const double y, const double z, const int axis = 2, const float rate = 1.0, const double roll = 0.0) 
- void **Point**(const [dVec3](CPP_dVec3.md)& position, const int axis = 2, const float rate = 1.0, const double roll = 0.0) 

### Parameters ###
| Name | Description |
| --- | --- |
| **entity** | entity to point to |
| **x** | x component of the position to point to |
| **y** | y component of the position to point to |
| **z** | z component of the position to point to |
| **position** | position to point to |
| **axis** | axis to align (0, 1, or 2) | 
| **rate** | can be used to gradually align the entity | 
| **roll** | rotation around the axis |
