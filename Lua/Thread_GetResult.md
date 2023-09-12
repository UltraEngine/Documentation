# Thread:GetResult #
This method can retrieve a return value set by a thread when it finishes execution.

## Syntax ##
```lua
function Thread:GetResult() -> table
```

## Returns ##
If the thread is finished the thread result is returned, otherwise nil is returned.

## Example ##
```lua
-- The returned value of the thread entry point will be used as the thread result
function MyFunc(o)
    return String("Hello!")
end

local thread = CreateThread(MyFunc)
thread:Resume()
thread:Wait()
local o = thread:GetResult()
local s = o:As(String)
Print(s)