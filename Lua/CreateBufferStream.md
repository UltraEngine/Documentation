# CreateBufferStream #

This function creates a new BufferStream object that allows read and writing to a block of memory as if it were a file.

## Syntax ##
`function CreateBufferStream(data:Buffer?, path: string = ""):BufferStream`

#### Parameters ####
| Parameter | Description |
| --- | --- |
| `data` | Can be used to specify an existing data buffer for the stream to use |
| `path` | Sets the Stream path member to simulate a file |

## Returns ##
Returns a new BufferStream object.

## Example

```lua
-- Create a memory buffer and fill in some data
local buffer = CreateBuffer(10 * 4)
for n = 0, 9 do
    buffer:PokeInt(n * 4, n)
end

-- Create a buffer stream
local stream = CreateBufferStream(buffer)

-- Read from the memory buffer as if it were a file
while not stream:EoF() do
    Print(stream:ReadInt())
end
```
