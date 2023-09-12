# CreateStaticBuffer #
This function creates a static buffer from an existing block of memory.

## Syntax ##
`CreateStaticBuffer(data: void*, size: uint64_t): Buffer`

### Parameters ###
| Name | Description |
| ----- | ----- |
| data | pointer to a block of allocated memory |
| size | size of the allocated memory block |

## Returns ###
Returns a new static buffer.

## Remarks ##
Caution should be exercised when using this command. The buffer cannot be resized and will not free the memory when the buffer is deleted. If the memory block is freed elsewhere while still in use in this buffer it may cause errors.

## Example ##
```lua
--Create an object
local v = Vec3(1, 2, 3)

--Create static buffer
local buffer = CreateStaticBuffer(v, ffi.sizeof(v))

--Print out the contents. Make sure the variable v is still in scope when you do this!
Print(buffer:PeekFloat(ffi.offsetof(Vec3, "x")))
Print(buffer:PeekFloat(ffi.offsetof(Vec3, "y")))
Print(buffer:PeekFloat(ffi.offsetof(Vec3, "z")))
```