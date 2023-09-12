# LoadFont

This function loads a font from a file path or stream.

## Syntax

- **LoadFont**(path: string, flags: LoadFlags = LOAD_DEFAULT): [Font](Font.md)
- **LoadFont**(stream: [Stream](Stream.md), flags: LoadFlags = LOAD_DEFAULT): [Font](Font.md)

**Parameters:**

- `path`: file path to load (string)
- `stream`: stream to read from ([Stream](Stream.md))
- `flags`: loading options, can be LOAD_DEFAULT or LOAD_NO_CACHE (LoadFlags)

**Returns:**

Returns the loaded font, or nil if the font could not be loaded.

## Example

```lua
function main()
    --Get the displays
    local displays = GetDisplays()

    --Create a window
    local window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

    --Create a framebuffer
    local framebuffer = CreateFramebuffer(window)

    --Create a world
    local world = CreateWorld()

    --Create a camera
    local camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC)
    camera:SetClearColor(0.125)

    --Create sprite
    local fontsize = 36
    local font = LoadFont("Fonts/arial.ttf")
    local sprite = CreateSprite(world, font, "Hello, World!", fontsize)
    local rect = CreateSprite(world, font:GetTextWidth("Hello, World!", fontsize), font:GetHeight(fontsize), true)

    --Center the text relative to the camera
    camera:SetPosition(sprite:GetBounds().center)

    --Main loop
    while not window:Closed() and not window:KeyHit(KEY_ESCAPE) do
        --Update world
        world:Update()

        --Render world
        world:Render(framebuffer, true)
    end
end
```