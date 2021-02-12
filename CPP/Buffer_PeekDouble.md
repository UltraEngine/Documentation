# Buffer::PeekDouble #
This method returns a double float value from the memory buffer.

## Syntax ##
- float **PeekDouble**(const uint64_t pos)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |

## Returns ##
Returns a double float value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.
