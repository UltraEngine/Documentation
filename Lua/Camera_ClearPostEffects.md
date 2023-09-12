# Camera:ClearPostEffects

This method removes all post-processing effects from the camera.

## Syntax

```lua
function Camera:ClearPostEffects()
```

## Example

```lua
-- Create a new camera
local camera = Camera()

-- Add post-processing effects to the camera
camera:AddPostEffect(Bloom())
camera:AddPostEffect(Vignette())
camera:AddPostEffect(ColorCorrection())

-- Clear the post-processing effects from the camera
camera:ClearPostEffects()
```