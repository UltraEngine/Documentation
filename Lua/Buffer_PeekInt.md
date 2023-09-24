# Buffer:PeekInt

This method returns a 32-bit signed integer from the memory buffer.

## Syntax

- number **PeekInt**(number position)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns an integer value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.
