

## Example

![Example](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateComboBox.png)

```lua
--Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.background:ClientSize()
local combobox = CreateComboBox((sz.x - 300) / 2, (sz.y - 30) / 2, 300, 30, ui.background)
for n = 0, 20 do
    combobox:AddItem("Item " .. tostring(n), n == 0)
end

-- Event loop
while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETSELECT then
        print("Item " .. tostring(ev.data) .. " selected")
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
