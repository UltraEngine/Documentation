# thread:Wait #
This method pauses the calling thread until the specified thread is finished running.

## Syntax ##
- `thread:Wait()`

## Example ##

```lua
-----------------------------------------------------------------------------------------------
-- 
-- This example calculates prime numbers first on a single thread, and then splits the
-- task up across multiple CPU cores. The time is measured and displayed for each run.
-- 
-----------------------------------------------------------------------------------------------

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
            --Print(num)
        end
    end
end

local range = 200000

Print("Single-threaded test:")
local starttime = Millisecs()
CalcPrimeNumbers(1, range)
local elapsed = Millisecs() - starttime
Print(tostring(elapsed) .. " milliseconds")

local threadcount = MaxThreads()
Print("Multi-threaded test (" .. tostring(threadcount) .. " threads):")
local threads = {}
starttime = Millisecs()
for n = 1, threadcount do
    threads[n] = CreateThread(function() CalcPrimeNumbers(range / threadcount * (n - 1), range / threadcount) end, true)
end
for n = 1, threadcount do
    threads[n]:Wait()
end
elapsed = Millisecs() - starttime
Print(tostring(elapsed) .. " milliseconds")
```