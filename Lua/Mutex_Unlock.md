# Mutex:unlock()

This method unlocks a mutex and allows other threads to execute the enclosed code.

## Syntax

- void **unlock**()

## Remarks

Use of mutexes locks should be minimized, as they can slow down multithreaded code so that it loses its advantages over single-threaded code.

```lua
-- 
-- This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
-- variable is incremented, to get the correct result.
-- 

local range = 100000
local threadcount = 8
local threads = {}

function CalcPrimeNumbers(start, size)
    for num = start, start + size do
        local count = 0
        for i = 2, math.floor(num / 2) do
            if num % i == 0 then
                count = count + 1
                break
            end
        end
        if count == 0 and num ~= 1 then
            mutex:lock()
            countprimenumbers = countprimenumbers + 1
            mutex:unlock()
        end
    end
end

for n = 1, threadcount do
    threads[n] = CreateThread(CalcPrimeNumbers, range / threadcount * (n-1), range / threadcount)
end
for n = 1, threadcount do
    threads[n]:wait()
end

Print(tostring(countprimenumbers) .. " prime numbers found.")
```