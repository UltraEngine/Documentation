# KTX2 Textures

KTX2 is a texture file format from Khronos Group. The format allows image data to be stored in game-ready compressed formats that can be uploaded directly to the GPU.

Unlike the DDS format, KTX2 includes information about a texture's filter mode and edge clamp mode.

## Super Compression

In addition to GPU compression formats, KTX2 also allows files to be stored with an extra layer of compression using Basis Universal super compression. They will still consume the same amount of memory when loaded, but file sizes can be much smaller. Since textures usually make up the biggest portion of a game's total disk space usage, this can significantly reduce your game's disk usage and download times.

Another nice feature of super-compressed textures is they can be transcoded at runtime into a variety of memory-compressed formats. This allows the same texture files to be used for different platforms that support different memory-compressed formats.
