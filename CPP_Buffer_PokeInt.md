# Buffer::PokeInt #
This method inserts a single integer into a memory buffer.

## Syntax ##
- void **PokeInt**(const uint64_t pos, const int i);

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **i** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.
