# Pixmap

Base class: [Asset](Asset.md)

This class provides an interface for loading, manipulating, and saving image data.

| Property | Type | Description |
| ----- | ----- | ----- |
| format | const [TextureFormat](Constants.md#TextureFormat) | format of the pixel data |
| size | const iVec2& | size of the pixmap |
| blocks | const iVec2& | number of blocks in the image, for compressed formats |
| pixels | const [Buffer](Buffer.md) | buffer containing pixel data |
| blocksize | const int& | size of each block, for compressed formats |
| [Blit](Pixmap_Blit.md) | Method | copies an area of a pixmap to another pixmap, with scaling and filtering |
| [Convert](Pixmap_Convert.md) | Method | converts a pixmap to another format |
| [CopyRect](Pixmap_CopyRect.md) | Method | copies an area of a pixmap to another pixmap |
| [Extract](Pixmap_Extract.md) | Method | extracts part of the pixmap into a new pixmap |
| [Fill](Pixmap_Fill.md) | Method | writes each pixel with the specified color |
| [Invalidate](Pixmap_Invalidate.md) | Method | updates a pixmap that is assigned to a widget |
| [ReadPixel](Pixmap_ReadPixel.md) | Method | reads a single pixel |
| [Resize](Pixmap_Resize.md) | Method | resizes the pixmap |
| [Sample](Pixmap_Sample.md) | Method | reads a pixel sample with bilinear filtering |
| [WritePixel](Pixmap_WritePixel.md) | Method | writes a single pixel |
| [CreatePixmap](CreatePixmap.md) | Function | Creates a new pixmap object. |
| [LoadPixmap](LoadPixmap.md) | Function | Loads a pixmap object from a file. |


```lua
-- Pixmap class
Pixmap = {}
Pixmap.__index = Pixmap

-- Constructor for Pixmap
function Pixmap:new()
  local self = setmetatable({}, Pixmap)
  -- Implementation goes here
  return self
end

-- Method: Blit
-- Copies an area of a pixmap to another pixmap, with scaling and filtering.
-- @param to_pixmap The target pixmap.
-- @param to_rect The target rectangle where the pixmap should be copied to.
-- @param from_pixmap The source pixmap.
-- @param from_rect The source rectangle to be copied from.
-- @param filter The scaling and filtering option.
function Pixmap:Blit(to_pixmap, to_rect, from_pixmap, from_rect, filter)
  -- Implementation goes here
end

-- Method: Convert
-- Converts a pixmap to another format.
-- @param format The desired format for the pixmap.
function Pixmap:Convert(format)
  -- Implementation goes here
end

-- Method: CopyRect
-- Copies an area of a pixmap to another pixmap.
-- @param to_pixmap The target pixmap.
-- @param to_rect The target rectangle where the pixmap should be copied to.
-- @param from_pixmap The source pixmap.
-- @param from_rect The source rectangle to be copied from.
function Pixmap:CopyRect(to_pixmap, to_rect, from_pixmap, from_rect)
  -- Implementation goes here
end

-- Method: Extract
-- Extracts part of the pixmap into a new pixmap.
-- @param rect The rectangle specifying the area to be extracted.
-- @return The new pixmap.
function Pixmap:Extract(rect)
  -- Implementation goes here
end

-- Method: Fill
-- Writes each pixel with the specified color.
-- @param color The color to fill the pixmap with.
function Pixmap:Fill(color)
  -- Implementation goes here
end

-- Method: Invalidate
-- Updates a pixmap that is assigned to a widget.
function Pixmap:Invalidate()
  -- Implementation goes here
end

-- Method: ReadPixel
-- Reads a single pixel.
-- @param x The x-coordinate of the pixel.
-- @param y The y-coordinate of the pixel.
-- @return The pixel value.
function Pixmap:ReadPixel(x, y)
  -- Implementation goes here
end

-- Method: Resize
-- Resizes the pixmap.
-- @param size The new size of the pixmap.
function Pixmap:Resize(size)
  -- Implementation goes here
end

-- Method: Sample
-- Reads a pixel sample with bilinear filtering.
-- @param uv The texture coordinates.
-- @param level The mipmap level.
-- @return The pixel sample.
function Pixmap:Sample(uv, level)
  -- Implementation goes here
end

-- Method: WritePixel
-- Writes a single pixel.
-- @param x The x-coordinate of the pixel.
-- @param y The y-coordinate of the pixel.
-- @param color The color to write.
function Pixmap:WritePixel(x, y, color)
  -- Implementation goes here
end

-- Function: CreatePixmap
-- Creates a new pixmap object.
-- @return The new pixmap object.
function CreatePixmap()
  -- Implementation goes here
end

-- Function: LoadPixmap
-- Loads a pixmap object from a file.
-- @param filename The path to the file.
-- @return The loaded pixmap object.
function LoadPixmap(filename)
  -- Implementation goes here
end
```