# CreateMenu

This function creates a menu widget. A menu item emits a `WIDGETACTION` event when it is selected.

## Syntax

`function CreateMenu(text: string, parent: Widget): Widget`

| Parameter | Description |
| --- | --- |
| text | initial widget text |
| parent | widget parent |

## Returns

Returns a new widget.

## Example

![CreateMenu](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateMenu.png)

```lua
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, GetDisplays()[1])

local ui = CreateInterface(window)

local sz = ui.root:ClientSize()
local menu = CreateMenu("", ui.root)

local menu_file = CreateMenu("File", menu)
local menu_new = CreateMenu("New", menu_file)
local menu_open = CreateMenu("Open", menu_file)
local menu_save = CreateMenu("Save", menu_file)
CreateMenu("", menu_file)
local menu_recentfiles = CreateMenu("Recent Files", menu_file)
local menu_recentfile1 = CreateMenu("Recent file 1", menu_recentfiles)
local menu_recentfile2 = CreateMenu("Recent file 2", menu_recentfiles)
local menu_recentfile3 = CreateMenu("Recent file 3", menu_recentfiles)
CreateMenu("", menu_file)
local menu_exit = CreateMenu("Exit", menu_file)

local menu_tools = CreateMenu("Tools", menu)
local menu_option = CreateMenu("Option", menu_tools)

local menu_help = CreateMenu("Help", menu)
local menu_helpcontents = CreateMenu("Help Contents", menu_help)

local panel = CreatePanel(0, menu.size.y, sz.x, sz.y - menu.size.y, ui.root)
panel:SetColor(0.15, 0.15, 0.15)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == menu_new then
            Confirm("Create New?")
        elseif ev.source == menu_open then
            RequestFile()
        elseif ev.source == menu_option then
            if menu_option:GetState() == WIDGETSTATE_SELECTED then
                menu_option:SetState(WIDGETSTATE_UNSELECTED)
            else
                menu_option:SetState(WIDGETSTATE_SELECTED)
            end
        elseif ev.source == menu_save then
            RequestFile("Save File", "", "All Files:*", 0, true)
        elseif ev.source == menu_exit then
            if Confirm("Quit Program?") then
                return 0
            end
        elseif ev.source == menu_recentfile1 then
            Notify("Recent file 1")
        elseif ev.source == menu_recentfile2 then
            Notify("Recent file 2")
        elseif ev.source == menu_recentfile3 then
            Notify("Recent file 3")
        elseif ev.source == menu_helpcontents then
            RunFile("https://www.ultraengine.com/learn")
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        if ev.source == window then
            return 0
        end
    end
end
```