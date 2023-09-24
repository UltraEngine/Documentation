# CreateStaticBuffer

This function creates a static buffer from an existing block of memory.

## Syntax

- [Buffer](Buffer.md) **CreateStaticBuffer**(userdata data, number size)

| Parameter | Description |
| ----- | ----- |
| data | pointer to a block of allocated memory |
| size | size of the allocated memory block |

## Returns

Returns a new static buffer.

## Remarks

Caution should be exercised when using this command. The buffer cannot be resized and will not free the memory when the buffer is deleted. If the memory block is freed elsewhere while still in use in this buffer it may cause errors.
