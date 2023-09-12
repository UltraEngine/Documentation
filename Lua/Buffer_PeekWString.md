# buffer:PeekWString
This method returns a wide string value from the memory buffer.

## Syntax
```lua
function buffer:PeekWString(pos: number): string
```

## Parameters
| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a wide string value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```lua
local ue = require "UltraEngine"
local s = "Hello, how are you today?"
local buffer = ue.CreateBuffer((string.len(s) + 1) * ue.sizeofwchar_t)
buffer:PokeWString(0, s)
print(buffer:PeekWString(0))
```
In this example, we are creating a buffer and storing a wide string in it. Then, we are printing the value of the wide string using the `PeekWString` method.