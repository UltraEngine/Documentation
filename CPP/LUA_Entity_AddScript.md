# Entity.AddScript #
This method adds a Lua script file to an entity. The properties and functions contained in the script will be added to the entity.

## Syntax ##
- boolean **AddScript**(string path, boolean callstart = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | path to the script file |
| **callstart** | if set to true true the Start function will be called |

## Returns ##
Returns true if the script was loaded and added, otherwise false is returned.

## Remarks ##
You can add multiple scripts to an entity. If scripts contain overlapping properties, then the most recent value will overwrite the existing value. If scripts contain overlapping function names, they will be sorted into a metafunction that calls each version of the function, in the order they were added. If multiple script functions return multiple values, they will all be returned by the metafunction.

## Example ##
```lua
--Get the primary display
local displaylist = ListDisplays()
local display = displaylist[1];

--Create a window
local window = CreateWindow(display, "My Game", 0, 0, 1280, 786, WINDOW_TITLEBAR)

--Create a rendering framebuffer
local framebuffer = CreateFramebuffer(window);

--Create a world
local world = CreateWorld()

--Create camera
local camera = CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetPosition(0, 2, 0)
camera:Move(0, 0, -2)

--Create light
local light = CreateLight(world, LIGHT_DIRECTIONAL)
light:SetColor(2);
light:SetRotation(35,15,0)

--Load model
local fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fanblades.glb")
fan:SetPosition(0, 2, 0)

--Attach a script
fan:AddScript("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Scripts/Objects/Movement/Spinner.lua")

--Main loop
while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do

	--Sync with the physics thread
	world:Update()

	--Sync with the rendering thread
	world:Render(framebuffer)

end
```