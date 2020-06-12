# Buffer::Resize #
This method resizes the allocated memory block. The contents of the buffer will be retained in the new memory block.

## Syntax ##
- bool **Resize**(uint64_t size, const bool padding = true)

### Parameters ###
| Name | Description |
| ----| ----|
|size|new size of the memory block|
|padding|if set to true the new block may be automatically padded internally for faster resizing|

## Returns ##
Returns true if the memory block is successfully resized, otherwise false is returned.
