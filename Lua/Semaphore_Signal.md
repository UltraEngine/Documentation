# Semaphore:Signal

This function sets the semaphore to the signaled state and releases any threads that are waiting on it.

Syntax
------
```lua
function Semaphore:Signal()
```

Example
-------
```lua
local UE = require("UltraEngine")

function EntryPoint(extra)
    -- Cast to Semaphore object
    local semaphore = tolua.cast(extra, "Semaphore")

    -- Wait for signaled state
    semaphore:Wait()

    return nil
end

local displays = UE.GetDisplays()

-- Create a window
local window = UE.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UE.WINDOW_CENTER | UE.WINDOW_TITLEBAR)

-- Create a semaphore
local semaphore = UE.CreateSemaphore()

-- Create a thread
local thread = UE.CreateThread(EntryPoint, semaphore)

while not window:Closed() and not window:KeyDown(UE.KEY_ESCAPE) do
    -- Press space to signal the semaphore
    if window:KeyHit(UE.KEY_SPACE) then
        semaphore:Signal()
    end

    -- Detect thread finished
    if thread:GetState() == UE.THREAD_FINISHED then
        UE.Notify("Thread finished!")
        return 0
    end
    UE.Sleep(1)
end

return 0
```