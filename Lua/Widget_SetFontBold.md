# Widget:SetFontBold

This method sets the font weight to make text bold or normal.

## Syntax

`SetFontBold(bold)`

- `bold` (boolean): font weight

## Example
```lua
function main()
    --Get the displays
    local displays = GetDisplays()

    --Create a window
    local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER)

    --Create User Interface
    local ui = CreateInterface(window)
    local sz = ui.root.ClientSize()

    local label = CreateLabel("Font scale:", 10, 10, sz.x - 20, 30, ui.root)

    local checkbox = CreateButton("Normal", 10, 40, sz.x - 20, 30, ui.root, BUTTON_CHECKBOX)

    local textarea = CreateTextArea(10, 75, sz.x - 20, sz.y - 85, ui.root, TEXTAREA_WORDWRAP)
    textarea.SetText("The quick brown fox jumps over the lazy dog.")

    while true do
        local ev = WaitEvent()
        if ev.id == EVENT_WIDGETACTION then
            if ev.source == checkbox then
                textarea.SetFontBold(ev.data)
                if ev.data then
                    checkbox.SetText("Bold")
                else
                    checkbox.SetText("Normal")
                end
            end
        elseif ev.id == EVENT_WINDOWCLOSE then
            return 0
        end
    end
    return 0
end

main()
```