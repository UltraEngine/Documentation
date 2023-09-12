# World:Render

This method sends all queued rendering instructions to the rendering thread and tells it to render and display the contents of this world.

## Syntax

- **Render**(framebuffer: [Framebuffer](Framebuffer.md), vsync: boolean = true, maxframerate: number = 0): void

## Parameters

- `framebuffer` (type: [Framebuffer](Framebuffer.md)): The framebuffer to render to.
- `vsync` (type: boolean, optional): If set to true, vertical sync is enabled. Default is true.
- `maxframerate` (type: number, optional): The maximum allowed framerate, or zero for unlimited. Default is 0.

## Remarks

If vertical sync is disabled, the framerate will be uncapped and will usually be higher, but screen tearing artifacts can occur. Vertical sync should be disabled when benchmarking performance.

Rendering in Ultra Engine is asynchronous, meaning it is executed on a separate thread from your game logic. Consequently, there is some delay between the first call to `World:Render` and the first appearance of visible graphics on the screen. Additionally, initialization of the renderer can fail if the hardware it is running on does not meet system requirements. You can evaluate the `STARTRENDERER` event to wait until the renderer has started drawing before you begin your game logic, to detect if the renderer has failed to initialize, and to retrieve the name of the graphics device the renderer is using. The `event.data` member will be set to 1 if the renderer was initialized successfully, otherwise it will be set to 0. The device name will be stored in the `event.text` member.

If your game spends a significant amount of time initializing a scene, you can save a few seconds of loading time by calling this method immediately after creating a framebuffer so that Vulkan initialization is performed at the same time your game is loading.

## Example

```lua
function main()
    -- Get the displays
    local displays = UltraEngine.GetDisplays()

    -- Create window
    local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR)

    -- Create world
    local world = UltraEngine.CreateWorld()

    -- Create framebuffer
    local framebuffer = UltraEngine.CreateFramebuffer(window)

    -- Create a camera
    local camera = UltraEngine.CreateCamera(world, UltraEngine.PROJECTION_ORTHOGRAPHIC)
    camera:SetClearColor(0.125)

    while not window:Closed() and not window:KeyDown(UltraEngine.KEY_ESCAPE) do
        while UltraEngine.PeekEvent() do
            local e = UltraEngine.WaitEvent()
            if e.id == UltraEngine.EVENT_STARTRENDERER then
                if e.data == 1 then
                    -- Display the graphics device name
                    window:SetText(window.text .. " - " .. e.text)
                else
                    -- Show error message
                    UltraEngine.Notify("Renderer failed to initialize.\n\n" .. e.text, "Error", true)
                    return 0
                end
            elseif e.id == UltraEngine.EVENT_QUIT then
                return 0
            end
        end

        world:Update()
        world:Render(framebuffer)
    end

    return 0
end

main()
```