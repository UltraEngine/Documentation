# Buffer::PeekWString #
This method returns a wide string value from the memory buffer.

## Syntax ##
- string **PeekWString**(const uint64_t pos)

### Parameters ###
| Name | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a wide string value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.
