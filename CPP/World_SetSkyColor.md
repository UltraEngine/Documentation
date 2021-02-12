# World::SetSkyColor #

This method sets the global sky color for reflections.

## Syntax ##
- void SetSkyColor(const Vec3& apex, const Vec3& nadir)
- void SetSkyColor(const float r0, const float g0, const float b0, const float r1, const float g1, const float b1)

## Example ##
```lua
--Get the primary display
local displays = ListDisplays()

--Create a window
local window = CreateWindow(displays[1], "Ultra Engine", 0, 0, 1280, 720, WINDOW_TITLEBAR + WINDOW_CENTER + WINDOW_CLIENT_COORDS)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()
world:SetAmbientLight(0.0)

--Create a camera
local camera = CreateCamera(world)
camera:Move(0,20,0)
camera:SetFOV(70)
camera:Move(0,0,-50)
camera:SetClearColor(0.125)
camera:ClearPostEffects()

--Load a model
local model = LoadModel(world,"https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Stanford/dragon.glb")
local mtl = CreateMaterial()
mtl:SetMetalness(1)
mtl:SetRoughness(0)
model:SetMaterial(mtl,true)

--World color settings
world:SetAmbientLight(0)
world:SetSkyColor(Vec3(1,1,1),Vec3(0,0,1))

--Main loop
while window:Closed() == false do

	model:Turn(0,0.2,0)
	world:Update()
	world:Render(framebuffer,true)

end
```