# widget:setValue

This method sets the value of a slider widget.

## Syntax

function widget:setValue(value)
    -- code here
end

| Parameter | Description |
|---|---|
| value | new value to set |

## Example

```lua
function main()
    -- Get the displays
    local displays = getDisplays()

    -- Create a window
    local window = createWindow("Ultra Engine", 0, 0, 800, 600, displays[1]) -- Lua arrays start at index 1

    -- Create User Interface
    local ui = createInterface(window)
    local sz = ui.root:clientSize()

    -- Create scrollbar
    local slider1 = createSlider(10, 10, 200, 30, ui.root, SLIDER_SCROLLBAR)
    slider1:setRange(3, 10)

    -- Create scrollbar
    local slider2 = createSlider(10, 10 + 50, 200, 30, ui.root, SLIDER_SCROLLBAR)
    slider2:setRange(1, 10)

    -- Create trackbar
    local slider3 = createSlider(10, 10 + 100, 200, 30, ui.root, SLIDER_TRACKBAR)
    slider3:setRange(10, 20)
    slider3:setValue(15)

    while (true)
    do
        local ev = waitEvent()
        local widget
        if ev.id == EVENT_WIDGETACTION then
            widget = ev.source:asWidget()
            print("Slider value: " .. tostring(widget:getValue()))
        elseif ev.id == EVENT_WINDOWCLOSE then
            return 0
        end
    end
end

main()
```