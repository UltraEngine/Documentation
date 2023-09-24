# CreateStreamBuffer

This function creates a new StreamBuffer object. A StreamBuffer is a file stream that can be treated like a memory buffer.

## Syntax

- shared_ptr<[StreamBuffer](StreamBuffer.md)> **CreateStreamBuffer**(shared_ptr<[Stream](Stream.md)> stream)
- shared_ptr<[StreamBuffer](StreamBuffer.md)> **CreateStreamBuffer**(shared_ptr<[Stream](Stream.md)> stream, uint64_t pos, uint64_t size)

| Parameter | Description |
|---|---|
| stream | stream to read from or write to |
| pos | starting position in the stream |
| size | size of the virtual buffer |

## Returns

If successful, returns a new StreamBuffer object.

If the specified range lies outside the position and size of the stream NULL will be returned.

If the specified size is zero NULL will be returned.

If the stream size is zero NULL will be returned.

If the stream is closed NULL will be returned.

## Remarks

If the position and size are not specified the position will be zero and the size will be equal to the stream size.

If the [Data](Buffer_data.md) method is called on a StreamBuffer object, it will return NULL since there is no pointer to data in memory.

if the [Resize](Buffer_Resize.md) method is called on a StreamBuffer object, no resizing will take place and false will be returned.

## Example

```lua
---------------------------------------------------------------------------------------------------
-- 
-- This example will load a heightmap into a streambuffer and create a "virtual" pixmap, without 
-- loading the entire file into memory. A sub-section of the heightmap will be extracted and saved.
-- This can be used to work with very large image files that cannot be loaded in memory.
-- 
---------------------------------------------------------------------------------------------------

-- Load FreeImage plugin
local plugin = LoadPlugin("Plugins/FITextureLoader")
if plugin == nil then
    Print("Failed to load FreeImage plugin.")
    return
end

-- Load heightmap data
local stream = ReadFile("https://github.com/UltraEngine/Documentation/raw/master/Assets/Terrain/1024.r16")
local streambuffer = CreateStreamBuffer(stream, 0, stream:GetSize())
local pixmap = CreatePixmap(1024, 1024, TEXTURE_R16, streambuffer)

-- Create sub-image and save
local submap = CreatePixmap(256, 256, TEXTURE_R16)
pixmap:CopyRect(0, 0, 256, 256, submap, 0, 0)
submap = submap:Convert(TEXTURE_RGBA)
submap:Save("output.png")

RunFile("output.png")
```
