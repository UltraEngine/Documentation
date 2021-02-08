# CreateBuffer #
This function creates a new memory buffer object.

## Syntax ##
- shared_ptr<[Buffer](CPP_Buffer.md)\> CreateBuffer(const uint64_t size)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **size** | size of the allocated memory block |

## Returns ###
If the memory is allocated successfully a new buffer object is returned, otherwise NULL is returned.
