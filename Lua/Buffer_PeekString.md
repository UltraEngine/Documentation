# Buffer:PeekString

This method returns a string value from the memory buffer.

## Syntax

```lua
function Buffer:PeekString(pos: number): string
```

| Parameter | Description |
| ---- | ----------- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a string value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```lua
buffer = CreateBuffer(ffi.sizeof("char") * (#s + 1))
buffer:PokeString(0, s)
print(buffer:PeekString(0))
```