# CreateTextureBuffer

This function creates a new texture buffer, for render-to-texture operations.

## Syntax

```lua
function CreateTextureBuffer(width, height, colorattachments, depthattachment)
```

- **width**: The width of the texture buffer.
- **height**: The height of the texture buffer.
- **colorattachments** (optional): The number of color textures to add, between 0 and 4. Default value is 1.
- **depthattachment** (optional): Set to true to add a depth texture. Default value is true.

## Returns

Returns a new texture buffer object.

## Example

```lua
world = CreateWorld()

window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

framebuffer = CreateFramebuffer(window)

light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetRotation(15, 15, 0)
light:SetColor(2)

camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -3)
camera:SetFOV(70)

box = CreateBox(world)

cone = CreateCone(world)
cone:SetPosition(1.25, 0, 0)
cone:SetColor(0, 0, 1)

sphere = CreateSphere(world)
sphere:SetPosition(-1.25, 0, 0)
sphere:SetColor(1, 0, 0)

texbuffer = CreateTextureBuffer(256, 256)
cam2 = CreateCamera(world)
cam2:SetClearColor(1, 1, 1)
cam2:SetRenderTarget(texbuffer)

mtl = CreateMaterial()
tex = texbuffer:GetColorAttachment()
mtl:SetTexture(tex)
box:SetMaterial(mtl)
cone:SetMaterial(mtl)
sphere:SetMaterial(mtl)

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    cam2:SetPosition(0, 0, 0)
    cam2:Turn(0, 1, 0)
    cam2:Move(0, 0, -3)

    world:Update()
    world:Render(framebuffer)
end
```

