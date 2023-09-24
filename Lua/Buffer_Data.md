# Buffer:Data

This method retrieves a pointer to the buffer's allocated memory block.

## Syntax

- userdata **Data**()

## Returns

Returns a pointer to the allocated block of memory, or returns NULL is no memory is allocated. The returned value cannot be used in Lua directly, but can be passed to a Lua module or another engine command.

## Remarks

This method exposes low-level memory allocations. If possible it is better to use the [Buffer:Copy](Buffer_Copy.md) method, which has more built-in error checking.

The pointer this method returns may become invalid if the buffer is resized. To prevent errors, this method should be called each time the pointer is used. Do not store the returned pointer in a variable to be reused.
