# CreateStreamBuffer

This function creates a new StreamBuffer object. A StreamBuffer is a file stream that can be treated like a memory buffer.

## Syntax

- shared_ptr<[StreamBuffer](StreamBuffer.md)> **CreateStreamBuffer**(shared_ptr<[Stream](Stream.md)> stream, uint64_t pos, uint64_t size)

| Parameter | Description |
|---|---|
| stream | stream to read from or write to |
| pos | starting position in the stream |
| size | size of the virtual buffer |

## Returns

Returns a new StreamBuffer object.

## Remarks

If the [Buffer::Data()](Buffer_data.md) method is called on a StreamBuffer object, it will return NULL since the data is not loaded in memory.

## Example

```c++
//---------------------------------------------------------------------------------------------------
// 
// This example will load a heightmap into a streambuffer and create a "virtual" pixmap, without 
// loading the entire file into memory. A sub-section of the heightmap will be extracted and saved.
// This can be used to work with very large image files that cannot be loaded in memory.
// 
//---------------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load FreeImage plugin
#ifdef _WIN64
    auto plugin = LoadPlugin("Plugins/FITextureLoader.*");
#else
    auto plugin = LoadPlugin("Plugins/x86/FITextureLoader.*");
#endif
    if (plugin == NULL)
    {
        Print("Failed to load FreeImage plugin.");
        return 0;
    }

    //Load heightmap data
    auto stream = ReadFile("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16");
    auto streambuffer = CreateStreamBuffer(stream, 0, stream->GetSize());
    auto pixmap = CreatePixmap(1024, 1024, TEXTURE_R16, streambuffer);

    //Create sub-image and save
    auto submap = CreatePixmap(256, 256, TEXTURE_R16);
    pixmap->CopyRect(0, 0, 256, 256, submap, 0, 0);
    submap = submap->Convert(TEXTURE_RGBA);
    submap->Save("output.png");

    RunFile("output.png");

    return 0;
}
```
