# Buffer::PokeString #
This method inserts a wide string into a memory buffer.

## Syntax ##
- void **PokeWString**(const uint64_t pos, const wstring& s)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **s** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.