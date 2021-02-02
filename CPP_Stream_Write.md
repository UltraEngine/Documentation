# Stream::Write #
This method writes a block of memory to the stream.

## Syntax ##
- uint64_t **Write**(shared_ptr<[Buffer](Buffer.md)> buffer, const uint64_t offset, const uint64_t size)
- uint64_t **Write**(const void* data, const uint64_t size)

### Parameters ###
| Name | Description |
| --- | --- |
| buffer | memory buffer to read from |
| offset | offset in bytes from memory buffer beginning |
| data | pointer to read from |
| size | number of bytes to write |

## Returns ##
Returns the number of bytes that were written to the stream.
