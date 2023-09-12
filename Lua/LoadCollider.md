## LoadCollider

This function loads a collision shape from a JSON file. Collision objects can be saved to a file by calling the [Save](Asset_Save.md) method.

### Syntax

```lua
function LoadCollider(path: wstring, flags: LoadFlags) -> shared_ptr<Collider>
function LoadCollider(stream: shared_ptr<Stream>, flags: LoadFlags) -> shared_ptr<Collider>
```

#### Parameters

| Parameter | Description |
| --- | --- |
| path | file path to open |
| stream | open stream to read from |
| flags | optional load settings |

### Returns

Returns the loaded collider object if it was successfully loaded, otherwise nil is returned.

### Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = CreateFramebuffer(window)

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Move(0, 1, -3)
camera:SetFOV(70)

--Create light
local light = CreateDirectionalLight(world)
light:SetRotation(45, 35, 0)

--Create ground
local ground = CreateBox(world, 10, 1, 10)
ground:SetPosition(0, -0.5, 0)

--Load model
local model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.glb")
model:SetPosition(0, 3, 0)
model:SetRotation(0, 0, 15)
model:SetMass(1)

--Load collision
local collision = LoadCollider("https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.phy")
model:SetCollider(collision)

while window:Closed() == false do
    world:Update()
    world:Render(framebuffer)
end

return 0
```