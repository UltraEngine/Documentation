# CreateMutex

This function creates a new Mutex object.

## Syntax

- shared_ptr<![CDATA[<]]>[Mutex](Mutex.md)<![CDATA[<]]> **CreateMutex**()

## Returns

Returns a new Mutex object.

```lua
--------------------------------------------------------------------------------------
-- 
-- This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
-- variable is incremented, to get the correct result.
-- 
--------------------------------------------------------------------------------------

local UltraEngine = require("UltraEngine")

local mutex = CreateMutex()
local countprimenumbers = 0

local function CalcPrimeNumbers(start, size)
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
    threads[n] = CreateThread(function() CalcPrimeNumbers(range / threadcount * (n - 1), range / threadcount) end, true)
end
for n = 1, threadcount do
    threads[n]:Wait()
end

Print(tostring(countprimenumbers) .. " prime numbers found.")
```