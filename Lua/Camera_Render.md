# Camera:Render

This method will trigger a refresh of a camera that is set to only render intermittently with the [Camera:SetRealtime](Camera_SetRealtime.md) command.

## Syntax

- **Render**()

## Remarks

Because rendering in Ultra Engine is asynchronous, the camera is not immediately rendered when this method is called. A call to this method guarantees the camera will render at least one more time before it stops refreshing, with whatever settings it has at the time of the next call to [World:Render](World_Render.md).

## Example

```lua
window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, GetDisplays()[1], WINDOW_CENTER | WINDOW_TITLEBAR)

world = CreateWorld()

framebuffer = CreateFramebuffer(window);

light = CreateBoxLight(world);
light:SetRange(-10, 10);
light:SetRotation(15, 15, 0);
light:SetColor(2);

camera = CreateCamera(world);
camera:SetClearColor(0.125);
camera:SetPosition(0, 0, -3);
camera:SetFov(70);

box = CreateBox(world)

cone = CreateCone(world);
cone:SetPosition(1.25, 0, 0);
cone:SetColor(0, 0, 1);

sphere = CreateSphere(world);
sphere:SetPosition(-1.25, 0, 0);
sphere:SetColor(1, 0, 0);

texbuffer = CreateTextureBuffer(256, 256);
cam2 = CreateCamera(world);
cam2:SetClearColor(1, 1, 1);
cam2:SetRenderTarget(texbuffer);
cam2:SetRealtime(false);

mtl = CreateMaterial();
tex = texbuffer:GetColorAttachment();
mtl:SetTexture(tex);
box:SetMaterial(mtl);
cone:SetMaterial(mtl);
sphere:SetMaterial(mtl);

while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    cam2:SetPosition(0, 0, 0);
    cam2:Turn(0, 1, 0);
    cam2:Move(0, 0, -3);

    if window:KeyHit(KEY_SPACE) then 
        cam2:Render()
    end

    world:Update()
    world:Render(framebuffer)
end
```
