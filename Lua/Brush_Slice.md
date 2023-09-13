# Brush:Slice

This method will slice a brush along a plane and return the two resulting pieces. The original brush will be unharmed.

## Syntax

- boolean **Slice**([Plane](Plane.md) plane, [Brush](Brush.md) operandA, [Brush](Brush.md) operandB, [Face](Face.md) sliceface = `nil`, number tolerance = 0.001)

| Parameter | Description |
|---|---|
| plane | The slice plane |
| operandA | The brush to receive the volume behind the slice plane |
| operandB | The brush to receive the volume in front of the slice plane |
| sliceface | If provided, material and texture mapping settings will be copied from this face to the end caps of the resulting brushes. This is useful for boolean operations, where one brush carves a volume out of another |
| tolerance | The error tolerance, should be greater than zero |

## Returns
If the plane intersects the brush, true is returned. Otherwise, false is returned. The results of the slice operation will be added to operandA and operandB.

Note: Either operandA or operandB may be nil, but if both are nil, the operation will always return false.

Brushes can be fractured by performing multiple slices.

Boolean addition and subtraction can be performed by slicing multiple planes, discarding one operand, and grouping the resulting brushes.

## Example

This example will create a brush and cut it into two pieces.

![Example](https://github.com/UltraEngine/Documentation/raw/master/Images/brush_slice.jpg)

```lua
--Get displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

-- Create a framebuffer
local framebuffer = CreateFramebuffer(window)

-- Create a world
local world = CreateWorld()

-- Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Turn(35, 0, 0)
camera:Move(0, 0, -6)

-- Create light
local light = CreateBoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)

-- Create brush
local brush = CreateBoxBrush(world, 10, 2, 2)

-- Slice brush
local A = CreateBrush(world)
local B = CreateBrush(world)
local sliceplane = Plane(1, 1, -1, 0)
if brush:Slice(sliceplane, A, B) then
    A:SetColor(0, 1, 0)
    A:Move(-0.75, 0, 0)

    B:SetColor(0, 0, 1)
    B:Move(0.75, 0, 0)

    brush = nil
else
    A = nil
    B = nil
end

collectgarbage()

-- Main loop
while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    world:Update()
    world:Render(framebuffer)
end
```
