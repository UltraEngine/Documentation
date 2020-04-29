# Entity.SetPosition
This method sets the position of an entity in 3-dimensional space, using local or global coordinates.

## Syntax
* **SetPosition**(number x, number y, number z, boolean global = false)
* **SetPosition**(Vec3 position, boolean global = false)

### Parameters
| Name | Description |
| ------ | ------ |
| x | X component of the specified position. |
| y | Y component of the specified position. |
| z | Z component of the specified position. |
| position | the position to set. |
| global | indicates whether the position should be set in global or local space. |

## Remarks
An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

The engine uses a left-handed coordinate system. The X axis points right, the Y axis points up, and the Z axis points forward.

## Example
```lua
--Get the displays
local displays = ListDisplays()

--Create a window
local window = CreateWindow(displays[1], "", 0, 0, 1280, 720, nil, WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:Move(0, 0, -4)

--Create box and set its orientation
local box = CreateBox(world) 
box:SetPosition(1, 0, 0)
box:SetRotation(0, 0, 45)
box:SetScale(2, 1, 1)

--Main loop
while (window->Closed() == false) do
  
  --Update world
  world:Update()

  --Render world
  world:Render(framebuffer)
  
end
```
