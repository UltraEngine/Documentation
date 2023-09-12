# emitEvent

This function adds an event to the event queue and triggers any callbacks added with the [listenEvent](listenEvent.md) function.

## Syntax

- **emitEvent**(event: [Event](Event.md)): boolean
- **emitEvent**(id: number, source: [Object](Object.md), data: number = 0, x: number = 0, y: number = 0, width: number = 0, height: number = 0, extra: [Object](Object.md)? = nil, text: string = ""): boolean

### Parameters

| Parameter | Description |
| --- | --- |
| event | event to emit |
| id | event ID |
| source | event source |
| data | event data |
| x | X component of event position |
| y | Y component of event position |
| width | X compononent of event size | 
| height | Y component of event size |
| extra | event extra data |
| text | event text data |

### Returns

If any event listener callback triggered by this event returns `false`, the function will return `false`, otherwise `true` is returned.

## Remarks

If any event listener callback triggered by this event returns `false`, no further listener callbacks will be called and the event will not be added to the event queue.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create user interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()
local button = CreateButton("Close window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            EmitEvent(EVENT_WINDOWCLOSE, window)
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        if ev.source == window then
            return 0
        end
    end
end
```