# CreateProgressBar

The progressbar widget displays a horizontal bar that indicates the progress of some task. The progress complete can be set using the [Widget::SetProgress](Widget_SetProgress.md) method.

## Syntax

- [Widget](Widget.md) **CreateProgressBar**(const int x, const int y, const int width, const int height, [Widget](Widget.md) parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Returns

Returns a new progress bar widget.

## Example

![CreateProgressBar](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateProgressBar.png)

```lua
function UpdateProgress(e, extra)
    local widget = extra:AsWidget()
    widget:SetProgress((e.data / 20.0) % 1.0)
    return true
end

--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.root:GetSize()
local widget = CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui.root)
widget:SetProgress(0.6)

local progresstimer = CreateTimer(500)
ListenEvent(EVENT_TIMERTICK, progresstimer, UpdateProgress, widget)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
