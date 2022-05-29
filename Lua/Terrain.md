# Terrain #

## Example ##
```lua
--Get the primary display
local displaylist = GetDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow(display, "Build Terrain", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR + WINDOW_CENTER)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:Turn(15,0,0)
camera:Move(0,10,-50)
camera:SetRange(0.1,4000)

--Create a light
local light = CreateLight(world,LIGHT_DIRECTIONAL)
light:SetRotation(45,-55,0)
light:SetColor(2,2,2,1)

local starttime = Millisecs()

--Create editable terrain
local terrain = CreateTerrain(world, 1024, 32)
terrain:SetScale(1,200,1)
if FileType("Terrain/1024") == 0 then
	CreateDir("Terrain/1024", true)
end

-----------------------------------------------------------------
--Load heightmap
-----------------------------------------------------------------

--Load saved DDS heightmap. Not any faster but easier to work with than RAW files
local heightmap = LoadPixmap("Terrain/1024/1024_H.dds")

if heightmap == nil then

	--We have to specify the width, height, and format then create the pixmap from the raw pixel data.
	local buffer = LoadBuffer("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16")
	heightmap = CreatePixmap(1024, 1024, TEXTURE_R16, buffer)

	--Save it for next time
	heightmap:Save("Terrain/1024/1024_H.dds")

end

--Apply the heightmap to the terrain
terrain:SetHeightMap(heightmap)

heightmap = nil

-----------------------------------------------------------------
--Normals
-----------------------------------------------------------------

--Load the saved normal data as a pixmap
local normaltangentmap = LoadPixmap("Terrain/1024/1024_NT.dds")

if normaltangentmap == nil then

	--Build normals for the entire terrain
	terrain:BuildNormals()

	--Retrieve a pixmap containing the normals in R8G8 format
	normaltangentmap = terrain:GetNormalTangentMap()

	--Save the pixmap as an uncompressed R8G8 DDS file, which will be loaded next time as a texture
	normaltangentmap:Save("Terrain/1024/1024_NT.dds")
	
	--Now save some textures for the static terrain example
	local normalmap = terrain:GetNormalMap()
	local tangentmap = terrain:GetTangentMap()
	
	--Convert to optimized BC5 format
	normalmap = normalmap:Convert(TEXTURE_BC5)
	tangentmap = tangentmap:Convert(TEXTURE_BC5)
	
	--Save the pixmaps as an compressed BC5 DDS file, which will be loaded next time as a texture
	normalmap:Save("Terrain/1024/1024_N.dds")
	tangentmap:Save("Terrain/1024/1024_T.dds")

else

	--Apply the texture to the terrain. (The engine will automatically create a more optimal BC5 compressed texture.)
	terrain:SetNormalTangentMap(normaltangentmap)

end

normaltangentmap = nil

-----------------------------------------------------------------
-- Material Layers
-----------------------------------------------------------------

--Add base layer
local mtl = LoadMaterial("Materials/Dirt/dirt01.mat")
local layerID = terrain:AddLayer(mtl)

--Add rock layer
mtl = LoadMaterial("Materials/Rough-rockface1.mtl")
local rockLayerID = terrain:AddLayer(mtl)
terrain:SetLayerSlopeConstraints(rockLayerID, 35, 90, 25)

--Add snow layer
mtl = LoadMaterial("Materials/Snow/snow01.mat")
local snowLayerID = terrain:AddLayer(mtl)
terrain:SetLayerHeightConstraints(snowLayerID, 50, 1000, 8)
terrain:SetLayerSlopeConstraints(snowLayerID, 0, 35, 10)

-----------------------------------------------------------------
-- Load / Build Layer and Alpha Maps
-----------------------------------------------------------------

local layermap = LoadPixmap("Terrain/1024/1024_L.dds")
local alphamap = LoadPixmap("Terrain/1024/1024_A.dds")

if layermap == nil or alphamap == nil then

	--Apply Layers
	terrain:SetLayer(rockLayerID, 1)
	terrain:SetLayer(snowLayerID, 1)

	--Save layer map - DO NOT USE LOSSY COMPRESSION
	local layermap = terrain:GetLayerMap()
	layermap:Save("Terrain/1024/1024_L.dds")

	--Save alpha map - Compresion might be okay but decompression is not currently supported
	local alphamap = terrain:GetAlphaMap()
	alphamap:Save("Terrain/1024/1024_A.dds")

else
	
	--Load layer map into terrain
	terrain:SetLayerMap(layermap)

	--Load alpha map into terrain
	terrain:SetAlphaMap(alphamap)

end

layermap = nil
alphamap = nil

-----------------------------------------------------------------
-- Tile Layers
-----------------------------------------------------------------
-- This is the most expensive step to process. We can save a lot of time
-- by loading the textures straight in and skipping calculation.
-----------------------------------------------------------------
-----------------------------------------------------------------

local layertexture = LoadTexture("Terrain/1024/1024_TL.dds")
local alphatexture = LoadTexture("Terrain/1024/1024_TA.dds")

if layertexture == nil or alphatexture == nil then

	--This can take a long time
	terrain:BuildTiles()

	--Save layer map - DO NOT USE LOSSY COMPRESSION
	local tilelayermap = terrain:GetTileLayerMap()
	tilelayermap:Save("Terrain/1024/1024_TL.dds")

	--Save alpha map - Convert to DXT5 (BC3) for better efficiency
	local tilealphamap = terrain:GetTileAlphaMap()
	--tilealphamap = tilealphamap:Convert(TEXTURE_DXT5)
	tilealphamap:Save("Terrain/1024/1024_TA.dds")

else

	terrain:BuildTiles()
	terrain.material:SetTexture(layertexture, TEXTURE_LAYER)
	terrain.material:SetTexture(alphatexture, TEXTURE_ALPHA)

end

Print("Terrain created in "..tostring(Millisecs() - starttime).." milliseconds.")

collectgarbage()

world:RecordStats(true)

--Main loop
while window:Closed() == false do

	local x=0
	local y=0
	local z=0
	if window:KeyDown(KEY_E) then y = y + 1 end
	if window:KeyDown(KEY_Q) then y = y - 1 end
	camera:Translate(0,y,0)
	y=0
	if window:KeyDown(KEY_W) then z = z + 5 end
	if window:KeyDown(KEY_S) then z = z - 5 end
	if window:KeyDown(KEY_RIGHT) then x = x + 5 end
	if window:KeyDown(KEY_LEFT) then x = x - 5 end
	camera:Move(x,0,z)
	if z == 0 then
		local rotation = camera.rotation
		if window:KeyDown(KEY_UP) then z = z + 5 end
		if window:KeyDown(KEY_DOWN) then z = z - 5 end
		if z~= 0 then
			camera:SetRotation(0,rotation.y,0)
			camera:Move(0,0,z)
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
