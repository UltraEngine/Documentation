# Buffer::PeekByte #
This method returns a single byte from the memory buffer.

## Syntax ##
- unsigned char **PeekByte**(const uint64_t pos)

### Parameters ###
| Name | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a byte value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.
