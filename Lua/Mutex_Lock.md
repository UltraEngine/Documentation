# Mutex:Lock

This method locks a mutex. When a mutex is locked, other threads that lock the mutex will pause until the locking thread calls [Mutex:Unlock()](Mutex_Unlock.md).

## Syntax

```lua
function Mutex:Lock()
```

## Remarks

Use of mutexes locks should be minimized, as they can slow down multithreaded code so that it loses its advantages over single-threaded code.

```lua
-------------------------------------------------------------------------------------
-- This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
-- variable is incremented, to get the correct result.
-------------------------------------------------------------------------------------

local mutex = CreateMutex()
local countprimenumbers = 0

function CalcPrimeNumbers(start, size)
    for num = start, start + size do
        local count = 0
        for i = 2, num / 2 do
            if num % i == 0 then
                count = count + 1
                break
            end
        end
        if count == 0 and num ~= 1 then
            mutex:Lock()
            countprimenumbers = countprimenumbers + 1
            mutex:Unlock()
        end
    end
end

local range = 100000
local threadcount = 8
local threads = {}

for n = 1, threadcount do
    threads[n] = CreateThread(function()
        CalcPrimeNumbers(range / threadcount * n, range / threadcount)
    end, true)
end

for n = 1, threadcount do
    threads[n]:Wait()
end

Print(tostring(countprimenumbers) .. " prime numbers found.")
```