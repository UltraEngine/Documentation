# Process:GetStatus

This method returns the current status of a running process.

## Syntax 

#### ProcessStatus Process:GetStatus()

## Returns

Returns the process status. This may be PROCESS_RUNNING or PROCESS_FINISHED. The [Process.Close](Process_Close.md) method should be called to close the handle and retrieve the exit code once this method returns PROCESS_FINISHED.

## Example

```lua
apppath = "C:/Windows/notepad.exe"

print("Launching process")
local proc = CreateProcess(apppath)

print("Process running")
while proc:GetStatus() == PROCESS_RUNNING do
    Sleep(500)
    print(".")
end

local exitcode = proc:Close()

print("Process finished (" .. tostring(exitcode) .. ")")
```