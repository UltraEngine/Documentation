# dVec3 #
This table describes a three-dimensional vector with double float precision.

## Members ##
- **x**, **r**, **width**: double
- **y**, **g**, **height**: double
- **z**, **b**, **depth**: double

## Constructors ##
- **dVec3**()
- **dVec3**(x: double)
- **dVec3**(x: double, y: double)
- **dVec3**(x: double, y: double, z: double)

## Methods ##
- DistanceToPoint()
- [Dot](#dVec3_Dot)
- Cross()
- Inverse()
- Length()
- [Normalize](#dVec3_Normalize)
- Reflect()

## Example ##
```lua
-- Create a new dVec3 object
local vec = dVec3()

-- Set values for the vector
vec.x = 1.0
vec.y = 2.0
vec.z = 3.0

-- Calculate the length of the vector
local length = vec:Length()

-- Normalize the vector
vec:Normalize()

-- Calculate the dot product of two vectors
local dotProduct = vec:Dot(anotherVec)

-- Reflect the vector
vec:Reflect()
```