## Sound:GetLength

This method returns the length of the sound file.

### Syntax

- **`number` GetLength()**

### Returns

Returns the length of the sound file, in seconds.

### Example

```lua
local sound = Sound() -- assuming the Sound class has been imported

local length = sound:GetLength()
print("Length of sound file: " .. length .. " seconds")
```