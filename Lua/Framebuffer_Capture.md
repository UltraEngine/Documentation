# Framebuffer:Capture

This method can be used to capture a screenshot.

## Syntax

- number **Capture**()

## Returns

Returns the index of the frame capture, which starts with zero and iterates with each call to this method.

## Remarks

This method will cause the contents of the framebuffer to be copied to a [Pixmap](Pixmap.md) when the first frame is rendered after the next call to [World::Render](World_Render.md). The captured image will be available in the extra member of an EVENT_FRAMECAPTURE event. One EVENT_FRAMECAPTURE event will be emitted for each call to this method. The event data member will store an index to the captured frame that starts at zero and iterates with each frame capture.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 0, -2)

--Create a light
local light = CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)
light:SetColor(2)

--Create a model
local box = CreateBox(world)
box:SetColor(0, 0, 1)

--Load the FreeImage plugin
local plugin = LoadPlugin("Plugins/FITextureLoader")

--Main loop
while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
    --Rotate the model
    box:Turn(0, 1, 0)

    --Press the space key to queue a screenshot
    if window:KeyHit(KEY_SPACE) then
        framebuffer:Capture()
    end

    --Look for captured frames
    while PeekEvent() do
        local e = WaitEvent()
        if e.id == EVENT_FRAMECAPTURE then
            --Get the pixmap containing the captured frame, save and open it
            local pixmap = e.extra:AsPixmap()
            local path = GetPath(PATH_DESKTOP) .. "/screenshot" .. tostring(e.data + 1) .. ".jpg"
            pixmap:Save(path)
            RunFile(path)
        end
    end

    --Update world
    world:Update()

    --Render world
    world:Render(framebuffer, true)
end
```
