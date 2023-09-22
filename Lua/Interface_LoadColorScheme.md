# Interface:LoadColorScheme

This method loads a color scheme from a JSON file.

## Syntax

- boolean **LoadColorScheme**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path, number flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns

Returns true if the color scheme was successfully loaded, otherwise false is returned.

## Remarks

Color schemes are stored in JSON format and define an RGB color for various widget attributes.

### Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.background:ClientSize()
local button_dark = CreateButton("Dark Theme", sz.x / 4 - 75, sz.y / 4 - 15, 150, 30, ui.background)
local button_light = CreateButton("Light Theme", sz.x / 4 * 3 - 75, sz.y / 4 - 15, 150, 30, ui.background)

-- Text area
local textarea = CreateTextArea(8, sz.y / 2, sz.x - 16, sz.y / 2 - 8, ui.background)
textarea:SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"))

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button_dark then
            -- Load dark color scheme
            ui:LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json")
            textarea:SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"))
        elseif ev.source == button_light then
            -- Load light color scheme
            ui:LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json")
            textarea:SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json"))
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        if ev.source == window then
            return 0
        end
    end
end
```
