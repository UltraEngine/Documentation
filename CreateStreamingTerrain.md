# CreateStreamingTerrain
This function creates a new streaming terrain. This type of terrain loads height and other data into memory only as it is needed, allowing display of very large landscapes.
### Syntax
```c++
std::shared_ptr<StreamingTerrain> CreateStreamingTerrain(std::shared_ptr<World> world, const int resolution, const int patchsize, const std::string& datapath, void FetchPatchInfo(TerrainPatchInfo*) = nullptr);
std::shared_ptr<StreamingTerrain> CreateStreamingTerrain(std::shared_ptr<World> world, const int resolution, const int patchsize, const std::wstring& datapath, void FetchPatchInfo(TerrainPatchInfo*) = nullptr);
```
### Parameters
| Name | Description |
| ------ | ------ |
| world | World to create the terrain in. |
| resolution | Number of terrain points along one edge. |
| patchsize | The size of one patch of terrain, This should be a power-of-two number. 128 is a good setting.|
| datapath | The file path or URL to the terrain data.|
| FetchPatchInfo | A user-defined callback function that retrieves terrain information as it is needed. |
### Returns
Returns a new streamed terrain.
### Example
``` lua
--Get the primary display
local displaylist = ListDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow(display, "Streaming Terrain", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR + WINDOW_CENTER)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0,0,1,1)
camera:Turn(35,0,0)
camera:SetRange(1,16384)
--camera:SetFogMode(true)
--camera:SetFogRange(0,16384)
--camera:SetFogColor(1,1,1,1)
--camera:SetTessellation(8)

--Create a light
local light = CreateLight(world,LIGHT_DIRECTIONAL)
light:SetRotation(45,-55,0)
light:SetColor(2,2,2,1)

--Create terrain
local terrain = CreateStreamingTerrain(world, 16384, 64, "Terrain/16384/16384")
terrain:SetScale(1,500,1)

local movespeed = 1

local box = LoadModel(world,"Models/Characters/Generic/generic.mdl")
box:SetPosition(0,terrain:GetElevation(16384/2, 16384/2, true),0)

camera:SetPosition(box:GetPosition())
camera:Translate(0,1,0)
camera:Move(0,0,-4)

--Main loop
while window:Closed() == false do
	local movespeed = 0.2
	if window:KeyDown(KEY_SHIFT) then movespeed = 5 end
	local x=0
	local z=0
	local y=0
	if window:KeyDown(KEY_E) then y = y + 5 end
	if window:KeyDown(KEY_Q) then y = y - 5 end
	camera:Translate(0,y*movespeed,0)
	if window:KeyDown(KEY_W) then z = z + 5 end
	if window:KeyDown(KEY_S) then z = z - 5 end
	if window:KeyDown(KEY_RIGHT) then x = x + 5 end
	if window:KeyDown(KEY_LEFT) then x = x - 5 end
	camera:Move(x*movespeed,0,z*movespeed,true)
	if z == 0 then
		local rotation = camera.rotation
		if window:KeyDown(KEY_UP) then z = z + 5 end
		if window:KeyDown(KEY_DOWN) then z = z - 5 end
		if z~= 0 then
			camera:SetRotation(0,rotation.y,0)
			camera:Move(0,0,z*movespeed)
			camera:SetRotation(rotation)
		end
	end
	y=0
	if window:KeyDown(KEY_D) then y = y + 1 end
	if window:KeyDown(KEY_A) then y = y - 1 end
	camera:Turn(0,y,0,true)

	world:Update()
	world:Render(framebuffer)

end

```
