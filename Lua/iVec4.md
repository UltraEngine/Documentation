# iVec4 #
This class describes a four-dimensional integer vector.

### Properties ###
| Name | Type | Description |
|-|-|-|
| x | number | x component of the vector |
| y | number | y component of the vector |
| z, width | number | z component of the vector |
| w, height | number | w component of the vector |
| iVec4() | Constructor | |
| iVec4(x: number) | Constructor | |
| iVec4(x: number, y: number, z: number, w: number) | Constructor | |

## Example ##
```lua
-- Create a default iVec4 object
local vec1 = iVec4()

-- Create an iVec4 object with only x component
local vec2 = iVec4(3)

-- Create an iVec4 object with all components
local vec3 = iVec4(4, 5, 6, 7)
```