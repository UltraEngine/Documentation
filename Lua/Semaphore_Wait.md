# Semaphore:Wait

This method waits until the semaphore is signaled by another thread. If the semaphore has already been set to the signaled state, this method will return immediately. This method will reset the condition signaled state so it can be signaled again.

## Syntax

```lua
function Semaphore:Wait()
```

## Example

```lua
--Semaphore example

--Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, GetDisplays()[1], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a semaphore
local semaphore = CreateSemaphore()

--Create a thread
local function EntryPoint(extra)
    --Cast to semaphore object
    local semaphore = extra:AsSemaphore()

    --Wait for signaled state
    semaphore:Wait()

    return nil
end

local thread = CreateThread(EntryPoint, semaphore)

while not window:Closed() and not window:KeyDown(KEY_ESCAPE) do
    --Press space to signal the semaphore
    if window:KeyHit(KEY_SPACE) then
        semaphore:Signal()
    end

    --Detect thread finished
    if thread:GetState() == THREAD_FINISHED then
        Notify("Thread finished!")
        return 0
    end
    
    Sleep(1)
end

return 0
```