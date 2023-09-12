# iVec2 #
This class describes a two-dimensional integer vector.

### Properties ###
| Name | Type | Description |
|-|-|-|
| x, width | int | x component of the vector |
| y, height | int | y component of the vector |
| iVec2 | Constructor | iVec2(x: int) |
| iVec2 | Constructor | iVec2(x: int, y: int) |

### Example ###
```lua
-- Create an iVec2 object with x = 5
local vec1 = iVec2(5)

-- Create an iVec2 object with x = 10 and y = 15
local vec2 = iVec2(10, 15)

-- Access x component of vec1
local xValue1 = vec1.x

-- Access y component of vec2
local yValue2 = vec2.y
```