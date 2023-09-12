# Process.Close #

This method closes a running process and returns its exit code.

## Syntax ##

- **Close**(): int

## Returns

Returns the process exit code.

## Remarks ##

To avoid forcefully terminating a running process call the [Process.Wait](Process_Wait.md) method instead of this method, or wait for [Process.GetStatus](Process_GetStatus.md) to return PROCESS_FINISHED before calling this method.

## Example ##

```lua
function main()
    local appname = "Notepad"
    local apppath = "C:/Windows/notepad.exe"

    --Get the displays
    local displays = GetDisplays()

    --Create a window
    local window = CreateWindow("Ultra Engine", 0, 0, 460, 480, displays[0])

    --Create User Interface
    local ui = CreateInterface(window)

    --Create widget
    local sz = ui.root.GetSize()
    local button = CreateButton("Launch " .. appname, (sz.x - 120) / 2, (sz.y - 30) / 2, 120, 30, ui.root)

    local proc = nil

    while true do
        local ev = WaitEvent()
        if ev.id == EVENT_WIDGETACTION then
            if ev.source == button then
                if proc then
                    proc.Close()
                    proc = nil
                    button.SetText("Launch " .. appname)
                else
                    button.SetText("Close " .. appname)
                    proc = CreateProcess(apppath)
                end
            end
        elseif ev.id == EVENT_WINDOWCLOSE then
            return 0
        end
    end
end

main()
```