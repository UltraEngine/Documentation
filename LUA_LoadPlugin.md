# LoadPlugin #
This function loads a plugin.

## Example ##
```lua
--Get the primary display
local displaylist = ListDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow(display, "Plugins", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:Move(0,0,-1)

--Create a light
local light = CreateLight(world,LIGHT_DIRECTIONAL)

--Display material
local model = CreateBox(world)
local mtl = CreateMaterial()
model:SetMaterial(mtl)

--Load VPK package plugin
local vpkloader = LoadPlugin("Plugins/VPK.*")

--Load VTF loader plugin. Comment this out and the texture will fail to load!
local vtfloader = LoadPlugin("Plugins/VTF.*")

--Steam installation path
local STEAM_PATH = "C:/Program Files (x86)/Steam/"
if FileType(STEAM_PATH) ~= 2 then
	Print("Please edit the STEAM_PATH variable in this script.")
	return
end

--Half-Life 2 path
local HL2_PATH = STEAM_PATH.."steamapps/common/Half-Life 2/hl2/"
if FileType(HL2_PATH) ~= 2 then
	Print("The game Half-Life 2 must be installed for this script to run.")
	return
end

--Load package (Half-Life 2 must be installed)
local pkg = LoadPackage(HL2_PATH.."hl2_textures_dir.vpk")

--Load texture
local tex = LoadTexture("materials/building_template/building_template002p.vtf")
if tex ~= nil then mtl:SetTexture(tex, TEXTURE_BASE) end

--Main loop
while window:Closed() == false do

	if window:KeyHit(KEY_SPACE) then
		model = nil
		collectgarbage()
	end

	world:Update()
	world:Render(framebuffer)

end
```
