# Widget:SetText

This method sets the widget text.

## Syntax

- **SetText**([string](https://www.lua.org/manual/5.4/manual.html#6.4) text)

| Parameter | Description |
|---|---|
| text | widget text to set |

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[1])

--Create User Interface
local ui = CreateInterface(window)

--Create widget
local sz = ui.background:ClientSize()
local textarea = CreateTextArea(10, 10, sz.x - 20, sz.y - 20, ui.background, TEXTAREA_WORDWRAP)

local s = "Night was falling now, and as I recalled what Akeley had written me about those earlier nights "..
"I shuddered to think there would be no moon. Nor did I like the way the farmhouse nestled in the lee of that "..
"colossal forested slope leading up to the Dark Mountain’s unvisited crest. With Akeley’s permission I lighted a small oil lamp, "..
"turned it low, and set it on a distant bookcase beside the ghostly bust of Milton; but afterward I was sorry I had done so, for "..
"it made my host’s strained, immobile face and listless hands look damnably abnormal and corpselike. He seemed half-incapable of motion, "..
"though I saw him nod stiffly once in a while."

textarea:SetText(s)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
