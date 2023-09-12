# LoadScene

This function loads a scene from a file path or stream.

## Syntax

- ```lua
  function LoadScene(world: table, path: string, flags: number): table
  ```
  
- ```lua
  function LoadScene(world: table, stream: table, binstream: table, flags: number): table
  ```

## Returns

If the scene is successfully loaded, a new scene object is returned. Otherwise, nil is returned.

## Remarks

This feature is in continued development and its behavior may change somewhat in future updates.

## Example

This example saves the starting scene and reloads it when the space key is pressed.

```lua
world = CreateWorld()

window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, GetDisplays()[1], WINDOW_CENTER | WINDOW_TITLEBAR)

framebuffer = CreateFramebuffer(window)

camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 1, -4)

light = CreateBoxLight(world)
light:SetRange(-10, 10)
light:SetArea(15, 15)
light:SetRotation(45, 35, 0)
light:SetColor(2)

ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)
ground:SetColor(0, 1, 0)

scene = {}
scene[1] = ground
scene[2] = light
ground = nil
light = nil

for n = 1, 10 do
    box = CreateBox(world)
    box:SetColor(0, 0, 1)
    box:SetPosition(Random(-5, 5), Random(5, 10), Random(-5, 5))
    box:SetMass(1)
    scene[#scene+1] = box
end

stream = CreateBufferStream()
binstream = CreateBufferStream()
scene.Save(stream, binstream)

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    if window:KeyHit(KEY_SPACE) then
        stream:Seek(0)
        binstream:Seek(0)
        scene = LoadScene(world, stream, binstream)
    end

    world:Update()
    world:Render(framebuffer)
end

return 0
```