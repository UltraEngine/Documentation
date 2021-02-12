# Buffer::PeekString #
This method returns a string value from the memory buffer.

## Syntax ##
- string **PeekString**(const uint64_t pos)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |

## Returns ##
Returns a string value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.