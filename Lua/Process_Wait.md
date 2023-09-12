# Process:Wait #

This method pauses the calling thread until the process finishes running and exits.

## Syntax ##

- number **Wait**()

## Returns ##

Returns the process exit code.

## Remarks ##
This method will close the handle to the finished process. You do not need to call [Process:Close](Process_Close.md) after calling this method.

## Example ##

```lua
Print("Launching process")
local proc = CreateProcess("C:/Windows/notepad.exe")
Print("Process running")
local exitcode = proc:Wait()
Print("Process ended (" .. tostring(exitcode) .. ")")
```
