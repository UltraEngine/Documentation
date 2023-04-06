# LoadMaterial
This function loads a material from a file or open stream.

### Syntax
* [Material](Material.md) **LoadMaterial**(string path, number flags = LOAD_DEFAULT)
* [Material](Material.md) **LoadMaterial**([Stream](Stream.md) stream, number flags = LOAD_DEFAULT)

### Parameters
| Name | Description |
| ------ | ------ |
| **path** | path or URL to the file to be loaded |
| **stream** | an open file stream to load the asset from |
| **flags** | LoadFlags parameter to use |

### Remarks
Any of the values below may be combined in the flags parameter:
- LOAD_DEFAULT: Default load behavior.
- LOAD_UNMANAGED: Does not store or load cached object.
- LOAD_QUIET: Does not print loading messages.
- LOAD_DUMP_INFO: Prints extra file information for debugging.
- LOAD_NO_OVERRIDE: Does not use workflows to redirect files.
- LOAD_NO_CACHE: Ignores cached copies of downloaded files.
 
### Example
```lua
--Get the primary display
local displaylist = GetDisplays()
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

--Load material
local mtl = LoadMaterial("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/brickwall01.mtl")
if mtl ~= nil then model:SetMaterial(mtl) end

--Main loop
while window:Closed() == false do
	world:Update()
	world:Render(framebuffer)
end
```
