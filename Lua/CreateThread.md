# createThread

This function creates a new Thread object.

## Syntax

- **createThread**(entrypoint: function(extra: any), extra: any, start: boolean): [Thread](Thread.md)
- **createThread**(entrypoint: function(), start: boolean): [Thread](Thread.md)

| Parameter | Description |
| --- | --- |
| entrypoint | function the thread will execute when it begins |
| extra | extra value passed to the entrypoint function |
| start | if set to true the thread will begin execution immediately, otherwise it will begin in the ready state |

## Returns

Returns a new thread object.

## Example

```lua
-----------------------------------------------------------------------------------------------
-- 
-- This example calculates prime numbers first on a single thread, and then splits the
-- task up across multiple CPU cores. THe time is measured and displayed for each run.
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
            -- print(num)
        end
    end
end

local range = 200000

print("Single-threaded test:")
local starttime = os.clock()
CalcPrimeNumbers(1, range)
local elapsed = os.clock() - starttime
print(elapsed .. " milliseconds")

local threadcount = 4
print("Multi-threaded test (" .. threadcount .. " threads):")
local threads = {}
starttime = os.clock()
for n = 1, threadcount do
    threads[n] = createThread(function()
        CalcPrimeNumbers(range / threadcount * (n - 1), range / threadcount)
    end, true)
end
for n = 1, threadcount do
    threads[n]:wait()
end
elapsed = os.clock() - starttime
print(elapsed .. " milliseconds")
```