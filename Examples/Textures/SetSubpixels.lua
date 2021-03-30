--Get the primary display
local displaylist = GetDisplays()
local display = displaylist[1];

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, display, WINDOW_CENTER + WINDOW_TITLEBAR)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

--Create a camera
local camera = CreateCamera(world)
camera:Move(0,0,-2)
camera:SetClearColor(0.125)

--Create scene
local box = CreateBox(world, 2)
box:Turn(25,0,0)

--Create a light
local light = CreateLight(world,LIGHT_DIRECTIONAL)
light:SetRotation(25,-55,0)
light:SetColor(2,2,2)

--LOAD_NO_OVERRIDE prevents workflow schemes from replacing file extension
local texture = LoadTexture("Materials/77684-blocks18c_1.jpg", LOAD_NO_OVERRIDE)
--local texture = LoadTexture("Materials/77684-blocks18c_1.dds", LOAD_NO_OVERRIDE)

local stamp = LoadPixmap("Materials/stamp.png")
if stamp.format ~= texture.format then
	stamp = stamp:Convert(texture.format)
end

local mtl = CreateMaterial()
mtl:SetTexture(texture, TEXTURE_BASE)
box:SetMaterial(mtl)

local mousestate = false
local mouseposition = Vec3(0,0,0)
local pickinfo = PickInfo()

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
	
	local mpos = window:GetMousePosition()
	if window:MouseDown(MOUSE_LEFT) == true and mpos:DistanceToPoint(mouseposition) > 1 then
		mouseposition = mpos
		local mousepos = window:GetMousePosition()
		if camera:Pick(framebuffer, mousepos.x, mousepos.y, pickinfo, 0, true, 0) then
			local texcoords = pickinfo:GetTexCoords()
			texture:SetSubPixels(stamp, 0, 0, stamp.size.x, stamp.size.y, (texcoords.x * texture.size.x - stamp.size.x / 2), (texcoords.y * texture.size.y - stamp.size.y / 2), 0, 0)
		end
	end

	world:Update()
	world:Render(framebuffer)

end