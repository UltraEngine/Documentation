# Buffer::PokeString #
This method inserts a string into a memory buffer.

## Syntax ##
- void **PokeString**(const uint64_t pos, const string& s)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **s** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.
