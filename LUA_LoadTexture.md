# LoadTexture
This function loads a texture from a file or open stream.

### Syntax
* void **LoadTexture**(const string& path, const LoadFlags flags = LOAD_DEFAULT)
* void **LoadTexture**(const wstring& path, const LoadFlags flags = LOAD_DEFAULT)
* void **LoadTexture**(shared_ptr<Stream> stream, const LoadFlags flags = LOAD_DEFAULT)

### Parameters
| Name | Description |
| ------ | ------ |
| **path** | path or URL to the file to be loaded |
| **stream** | an open file stream to load the asset from |
| **flags** | LoadFlags parameter to use |

### Remarks
Any of the values below may be combined in the flags paramter:
| Name | Description |
| ------ | ------ |
| **LOAD_DEFAULT** | Default load flags. | 
| **LOAD_UNMANAGED** | Does not store or load cached object. |
| **LOAD_QUIET** | Does not print loading messages. |
| **LOAD_NO_OVERRIDE** | Does not use workflows to redirect files. |
 
### Example
```lua
--Get the primary display
local displaylist = ListDisplays()
local display = displaylist[1];
if display == nil then RuntimeError("Primary display not found.") end
local displayscale = display:GetScale()

--Create a window
local window = CreateWindow(display, "Example", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR)

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
local tex = LoadTexture("https://www.github.com/Leadwerks/Documentation/raw/master/Assets/brickwall01.dds")
if tex ~= nil then mtl:SetTexture(tex, TEXTURE_BASE) end

--Main loop
while window:Closed() == false do
	world:Update()
	world:Render(framebuffer)
end
```
