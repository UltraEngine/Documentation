# Brush:IntersectsBrush

This method can be used to test whether two brushes intersect.

## Syntax

- boolean **IntersectsBrush**([Brush](Brush.md) brush)

| Parameter | Description |
|---|---|
| brush | the brush to test intersection against |

## Returns

Returns true if the two brushes overlap, otherwise false is returned.

## Example

Use the left and right key to move the blue brush. When the two objects intersect, it will turn red.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/brush_intersectsbrush.jpg)

```lua
#include "UltraEngine.lua"

local window = Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)
local framebuffer = Framebuffer(window)
local world = World()
local camera = Camera(world)
camera:SetClearColor(0.125)
camera:Turn(35, 0, 0)
camera:Move(0, 0, -6)
local light = BoxLight(world)
light:SetRange(-20, 20)
light:SetArea(20, 20)
light:SetRotation(35, 35, 0)
light:SetColor(3)
local brush = BoxBrush(world, 10, 2, 2)
local A = Brush(world)
local B = Brush(world)
local sliceplane = Plane(1, 1, -1, 0)
brush:Slice(sliceplane, A, B)
A:SetColor(0, 1, 0)
A:Move(-0.75, 0, 0)
B:SetColor(0, 0, 1)
B:Move(0.75, -0.5, 0.5)
brush = nil

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    B:Move((window:KeyDown(KEY_RIGHT) - window:KeyDown(KEY_LEFT)) * 0.1, 0, 0)
    
    if A:IntersectsBrush(B) then
        B:SetColor(1, 0, 0)
    else
        B:SetColor(0, 0, 1)
    end

    world:Update()
    world:Render(framebuffer)
end

return 0
```

**Note:** The `Brush` class and functions used are assumed to be imported from the required libraries in Lua.
