# LoadTexture
This function loads a texture from a file or opened stream.

### Syntax
* void LoadTexture(const string& path, const LoadFlags flags = LOAD_DEFAULT)
* void LoadTexture(const wstring& path, const LoadFlags flags = LOAD_DEFAULT)
* void LoadTexture(shared_ptr<Stream> stream, const LoadFlags flags = LOAD_DEFAULT)

### Parameters
| Name | Description |
| ------ | ------ |
| path |  |
| stream |  |
| flags |  |

### Example
```lua
--Get the primary display
local displaylist = ListDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow(display, "Download File", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR)

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

--Load texture
local tex = LoadTexture("https://github.com/Leadwerks/Documentation/raw/master/Assets/brickwall01.dds")
if tex ~= nil then mtl:SetTexture(tex, TEXTURE_BASE) end

--Main loop
while window:Closed() == false do
	world:Update()
	world:Render(framebuffer)
end
```
