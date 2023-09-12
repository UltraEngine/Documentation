# Buffer:Clear #
When a buffer is first created its contents are random. This method sets each byte in the allocated memory block to zero.

## Syntax ##
- **Buffer:Clear()**

## Example ##
```lua
buffer = CreateBuffer(4)
Print("Initial contents: " .. buffer:PeekInt(0))
buffer:Clear()
Print(buffer:PeekInt(0))
```