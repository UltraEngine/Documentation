# Buffer::data #
This method retrieves a pointer to the buffer's allocated memory block.

## Syntax ##
- void* **data**()

## Returns ##
Returns a pointer to the allocated block of memory, or returns NULL is no memory is allocated.

## Remarks ##
The pointer this method returns may become invalid if the buffer is resized. To prevent errors, this method should be called each time the pointer is used. Do not store the returned pointer in a variable to be reused.