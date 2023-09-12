# Buffer:Copy

This function copies the contents of this buffer to another one.

## Syntax

```lua
function Buffer:Copy(srcoffset, dst, dstoffset, size)
```

## Parameters

- `srcoffset` - offset for the source buffer data, in bytes.
- `dst` - destination buffer.
- `dstoffset` - offset for the destination buffer data, in bytes.
- `size` - number of bytes to copy.

## Remarks

A runtime error will occur if the source or destination range lies outside of the buffer extents.

## Example

```lua
local buffer = CreateStaticBuffer({0,1,2,3,4,5,6,7,8,9}, 10 * 4)
local buffer2 = CreateBuffer(4 * 4)

buffer:Copy(3 * 4, buffer2, 0, buffer2:GetSize())

for n = 0, 3 do
    Print(buffer2:PeekInt(n * 4))
end
```