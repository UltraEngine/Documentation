# CreateSemaphore

This function creates a semaphore object which can be signaled by one thread and waited on by another thread, for thread synchronization.

## Syntax

```
CreateSemaphore()
```

## Returns

Returns a new semaphore object.

## Example

```lua
local UltraEngine = require "UltraEngine"

local function EntryPoint(extra)
    -- Cast to Semaphore object
    local semaphore = tolua.cast(extra, "Semaphore")
    
    -- Wait for signaled state
    semaphore:Wait()
    
    return nil
end

local displays = UltraEngine.GetDisplays()

-- Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], UltraEngine.WINDOW_CENTER + UltraEngine.WINDOW_TITLEBAR)

-- Create a semaphore
local semaphore = CreateSemaphore()

-- Create a thread
local thread = UltraEngine.CreateThread(EntryPoint, semaphore)

while not window:Closed() and not window:KeyDown(UltraEngine.KEY_ESCAPE) do
    -- Press space to signal the semaphore
    if window:KeyHit(UltraEngine.KEY_SPACE) then
        semaphore:Signal()
    end
    
    -- Detect thread finished
    if thread:GetState() == UltraEngine.THREAD_FINISHED then
        UltraEngine.Notify("Thread finished!")
        return 0
    end
    
    UltraEngine.Sleep(1)
end

return 0
```