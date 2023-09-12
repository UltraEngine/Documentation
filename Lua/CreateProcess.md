# CreateProcess #
This function launches an external executable and returns a handle that can be used for interaction.

## Syntax ##
**CreateProcess**(path: [string](https://www.lua.org/manual/5.4/manual.html#6.1)) -> [Process](Process.md)

### Parameters ###
| Name | Description |
|---|---|
| path | file path of the executable to launch |

## Returns ##
If the program was launched, a new process is returned. Otherwise, nil is returned.

## Example ##

```lua
function main()
    print("Launching process")
    local proc = CreateProcess("C:/Windows/notepad.exe")
    print("Process running")
    local exitcode = proc:Wait()
    print("Process ended (" .. tostring(exitcode) .. ")")
end

main()
```