# Buffer:PokeString
This method inserts a string into a memory buffer.

## Syntax
```lua
Buffer.PokeString(pos, s)
```
### Parameters
| Parameter | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **s** | value to insert |

## Remarks
The buffer must have enough space to store the string plus an extra NULL character. A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```lua
local UltraEngine = require("UltraEngine")

local s = "Hello, how are you today?"
local buffer = UltraEngine.CreateBuffer((string.len(s) + 1) * string.len(s:sub(1,1)))
buffer:PokeString(0, s)
UltraEngine.Print(buffer:PeekString(0))
```