# CreateMenu

This function creates a menu widget. A menu item emits a WIDGETACTION event when it is selected.

## Syntax

- [Widget](Widget.md) **CreateMenu**([string](https://www.lua.org/manual/5.4/manual.html#6.4) text, [Widget](Widget.md) parent)

| Parameter | Description |
| --- | --- |
| text | initial widget text |
| parent | widget parent |

## Returns

Returns a new widget.

## Example

![CreateMenu](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateMenu.png)

```lua
-- Get information about the displays
local displays = GetDisplays()

-- Create the main window with specified dimensions and use the first display
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create a user interface (UI) within the main window
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()

-- Create a top-level menu for the UI
local menu = CreateMenu("", ui.background)

-- Create a 'File' submenu under the top-level menu
local menu_file = CreateMenu("File", menu)

-- Create submenus under the 'File' submenu
local menu_new = CreateMenu("New", menu_file)
local menu_open = CreateMenu("Open", menu_file)
local menu_save = CreateMenu("Save", menu_file)

-- Create a separator line within the 'File' submenu
CreateMenu("", menu_file)

-- Create a submenu for recent files within the 'File' submenu
local menu_recentfiles = CreateMenu("Recent Files", menu_file)
local menu_recentfile1 = CreateMenu("Recent file 1", menu_recentfiles)
local menu_recentfile2 = CreateMenu("Recent file 2", menu_recentfiles)
local menu_recentfile3 = CreateMenu("Recent file 3", menu_recentfiles)

-- Create another separator line within the 'File' submenu
CreateMenu("", menu_file)

-- Create an 'Exit' option within the 'File' submenu
local menu_exit = CreateMenu("Exit", menu_file)

-- Create a 'Tools' submenu under the top-level menu
local menu_tools = CreateMenu("Tools", menu)

-- Create an 'Option' submenu within the 'Tools' submenu
local menu_option = CreateMenu("Option", menu_tools)

-- Create a 'Help' submenu under the top-level menu
local menu_help = CreateMenu("Help", menu)

-- Create a 'Help Contents' submenu within the 'Help' submenu
local menu_helpcontents = CreateMenu("Help Contents", menu_help)

-- Create a panel within the UI, positioned below the menu

local panel = CreatePanel(0, menu.size.y, sz.x, sz.y - menu.size.y, ui.background)
panel:SetColor(0.15, 0.15, 0.15)

-- Enter a loop to handle events
while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        -- Handle widget actions (e.g., menu clicks)
        if ev.source == menu_new then
            Confirm("Create New?")
        elseif ev.source == menu_open then
            RequestFile()
        elseif ev.source == menu_option then
            -- Toggle the 'Option' submenu state
            if menu_option:GetState() == WIDGETSTATE_SELECTED then
                menu_option:SetState(WIDGETSTATE_UNSELECTED)
            else
                menu_option:SetState(WIDGETSTATE_SELECTED)
            end
        elseif ev.source == menu_save then
            -- Request to save a file
            RequestFile("Save File", "", "All Files:*", 0, true)
        elseif ev.source == menu_exit then
            -- Confirm quitting the program and return if confirmed
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
            -- Open a web page for help contents
            RunFile("https://www.ultraengine.com/learn")
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        -- Handle window close event, and return if it's the main window
        if ev.source == window then
            return
        end
    end
end
```
