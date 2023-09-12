# CreateTimer #
This function creates a new timer object. A timer emits a TIMERTICK event at a regular frequency. The event source will be the timer object, and the event data value will be the timer tick count.

## Syntax ##
`CreateTimer(frequency: number): Timer`


### Parameters ###
| Name | Description |
| --- | --- |
| frequency | timer frequency in milliseconds |

## Returns ##
Returns a new timer object.

## Example ##

```lua
window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])
ui = CreateInterface(window)
sz = ui.root:ClientSize()

label = CreateLabel("", 0, 0, sz.x, sz.y, ui.root, LABEL_CENTER | LABEL_MIDDLE)
label:SetFontScale(4)

timer = CreateTimer(1000)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_TIMERTICK then
        label:SetText(ev.data)
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```