# Buffer:PeekFloat

This method returns a 32-bit float value from the memory buffer.

## Syntax

- number **PeekFloat**(number position)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a float value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.
