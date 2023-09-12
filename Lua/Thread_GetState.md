# Thread:GetState #
This method returns the thread's current state.

## Syntax ##
- `Thread:GetState()`

## Returns ##
The returned value may be `THREAD_READY`, `THREAD_RUNNING`, or `THREAD_FINISHED`.

## Example ##
```lua
function ThreadFunc()
    Sleep(1000)
end

function PrintState(thread)
    local state = thread:GetState()
    if state == THREAD_READY then
        Print("Ready")
      elseif state == THREAD_RUNNING then
        Print("Running")
      elseif state == THREAD_FINISHED then
        Print("Finished")
    end
end

-- Create thread
local thread = CreateThread(bind(ThreadFunc))
PrintState(thread)

-- Execute thread
thread:Resume()
PrintState(thread)

-- Wait for thread to finish
thread:Wait()
PrintState(thread)
```