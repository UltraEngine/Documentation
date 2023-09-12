# TextureBuffer

Base class: [Object](Object.md)

This class is used for render-to-texture operations.

```lua
-- @class TextureBuffer
TextureBuffer = Object:subclass("TextureBuffer")

-- @property size: const iVec2&
TextureBuffer.size = nil

-- @method CountColorAttachments(): number
function TextureBuffer:CountColorAttachments() end

-- @method GetColorAttachment(): any
function TextureBuffer:GetColorAttachment() end

-- @method GetDepthAttachment(): any
function TextureBuffer:GetDepthAttachment() end

-- @method GetSize(): iVec2
function TextureBuffer:GetSize() end

-- @method SetColorAttachment(attachment: any): void
function TextureBuffer:SetColorAttachment(attachment) end

-- @method SetDepthAttachment(attachment: any): void
function TextureBuffer:SetDepthAttachment(attachment) end

-- @function CreateTextureBuffer(): TextureBuffer
function CreateTextureBuffer() end
```

## Methods

### CountColorAttachments

```lua
-- @method CountColorAttachments(): number
function TextureBuffer:CountColorAttachments() end
```

Returns the number of color attachments.

### GetColorAttachment

```lua
-- @method GetColorAttachment(): any
function TextureBuffer:GetColorAttachment() end
```

Returns the color attachment.

### GetDepthAttachment

```lua
-- @method GetDepthAttachment(): any
function TextureBuffer:GetDepthAttachment() end
```

Returns the depth attachment.

### GetSize

```lua
-- @method GetSize(): iVec2
function TextureBuffer:GetSize() end
```

Returns the texture buffer dimensions.

### SetColorAttachment

```lua
-- @method SetColorAttachment(attachment: any): void
function TextureBuffer:SetColorAttachment(attachment) end
```

Sets the color render texture.

### SetDepthAttachment

```lua
-- @method SetDepthAttachment(attachment: any): void
function TextureBuffer:SetDepthAttachment(attachment) end
```

Sets the depth render texture.

## Functions

### CreateTextureBuffer

```lua
-- @function CreateTextureBuffer(): TextureBuffer
function CreateTextureBuffer() end
```

Returns a new texturebuffer object.