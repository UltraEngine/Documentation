# Camera:Pick

This function performs a raycast at the specified screen coordinate.

## Syntax

- PickInfo Pick(framebuffer, x, y, radius = 0.0, closest = false, filter(entity, object) = nil, extra = nil)
- PickInfo Pick(buffer, screencoord, radius = 0.0, closest = false, filter(entity, object) = nil, extra = nil)

| Parameter | Description |
| ----- | ----- |
| framebuffer | framebuffer to test with |
| screencoord, (x, y) | screen coordinate to pick |
| radius | pick sphere radius |
| closest | if true the closest point will be determined |
| filter | optional callback to filter objects |
| extra | extra value to send to the filter callback |

## Returns

Returns a PickInfo structure. If the *success* member of the structure is true, an object was hit. Otherwise, it will be false.

If a filter callback is provided, it will be called for each entity that is evaluated. If the callback returns true, the entity will be tested. Otherwise, it will be skipped.

## Example

```lua
-- Import necessary libraries
local UltraEngine = require "UltraEngine"

-- Function to be used as a filter callback
local function PickFilter(entity, extra)
    return true
end

-- Main function
function main()
    -- Get the displays
    local displays = UltraEngine.GetDisplays()

    -- Create a window
    local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[1], UltraEngine.WINDOW_CENTER + UltraEngine.WINDOW_TITLEBAR)

    -- Create a world
    local world = UltraEngine.CreateWorld()

    -- Create a framebuffer
    local framebuffer = UltraEngine.CreateFramebuffer(window)

    -- Create light
    local light = UltraEngine.CreateBoxLight(world)
    light:SetRange(-10, 10)
    light:SetRotation(15, 15, 0)
    light:SetColor(2)

    -- Create camera
    local camera = UltraEngine.CreateCamera(world)
    camera:SetClearColor(0.125)
    camera:SetPosition(0, 0, -3)
    camera:SetFov(70)

    -- Create scenery
    local box = UltraEngine.CreateBox(world)

    local cone = UltraEngine.CreateCone(world)
    cone:SetPosition(1.25, 0, 0)

    local sphere = UltraEngine.CreateSphere(world)
    sphere:SetPosition(-1.25, 0, 0)

    -- Main loop
    while not window:Closed() and not window:KeyDown(UltraEngine.KEY_ESCAPE) do
        -- Click on an object to change its color
        if window:MouseHit(UltraEngine.MOUSE_LEFT) then
            box:SetColor(1, 1, 1)
            cone:SetColor(1, 1, 1)
            sphere:SetColor(1, 1, 1)
            local mousepos = window:GetMousePosition()
            local pick = camera:Pick(framebuffer, mousepos.x, mousepos.y, 0, true, PickFilter, nil)
            if pick.success then
                pick.entity:SetColor(1, 0, 0)
            end
        end

        world:Update()
        world:Render(framebuffer)
    end
end

-- Call the main function
main()
```