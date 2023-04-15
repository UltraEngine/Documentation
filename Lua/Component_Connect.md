# Component::Connect

## Syntax

- void **Connect**(function output, [Component](Component.md) target, function input, table arguments = {} )

## Example

When the space key is pressed, the component conneciton arguments will be printed to the console.

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_CENTER | WINDOW_TITLEBAR)

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
light:SetColor(2)
light:SetRange(-5, 5)

--Create the ground
local ground = CreateBox(world, 10, 0.25, 10)
ground.name = "Ground"
ground:SetPosition(0,-1,0)

--Define sender component
local sender = {}
function sender:Send()
	Print("Calling Send method...")
end

--Define receiver component
local receiver = {}
function receiver:Receive(a, b, c)
	Print("Receive is triggered!")
	Print(a)
	Print(b)
	Print(c)
end

local entity1 = CreateBox(world)
entity1:SetColor(0,1,0)
entity1:SetPosition(-1,0,0)
local sender = entity1:AddComponent(sender, "Sender")

local entity2 = CreateBox(world)
entity2:SetColor(0,0,1)
entity2:SetPosition(1,0,0)
local receiver = entity2:AddComponent(receiver, "Receiver")

sender:Connect(sender.Send, receiver, receiver.Receive, { true, 2, "Hello!" })

while window:KeyDown(KEY_ESCAPE) == false and window:Closed() == false do

	if window:KeyHit(KEY_SPACE) then sender:Send() end

	--Update the world
	world:Update()

	--Render the world to the framebuffer
	world:Render(framebuffer)

end
```
