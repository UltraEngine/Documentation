# Program:Quit

This method attempts to exit the program. If any unsaved files are open the program will prompt the user to save them before closing.

## Syntax

- **Quit**(boolean force = false)

| Parameter | Description |
|---|---|
| force | if set to true the program will immediately close without saving open files |

## Example

```lua
--[[
Are you tired of exiting programs the boring old way?
This amazing extension will bring new life to your computing experience!
]]

program.sidepanel.tabber:AddItem("Turboquit", true);

local sz = program.sidepanel.tabber:ClientSize();

local panel = CreatePanel(0, 0, sz.x, sz.y, program.sidepanel.tabber);

local button = CreateButton("Quit", 20, 20, sz.x - 40, 30, panel);

local function hook()
    if Confirm("Do you really want to quit?", program.title) == 1 then
        program:Quit();
    end
end

ListenEvent(EVENT_WIDGETACTION, button, hook);
```
