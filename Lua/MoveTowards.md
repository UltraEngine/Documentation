# MoveTowards

This function increments one value towards a target at a steady rate.

## Syntax

`moveTowards(start, stop, amount)`

- *start* (number): beginning value
- *stop* (number): destination value
- *amount* (number): maximum distance to move

## Returns

(number) - The incremented value. If the difference between the values is less than *amount* then *stop* will be returned.

## Example

```lua
local function moveTowards(start, stop, amount)
    if math.abs(stop - start) <= amount then
        return stop
    elseif stop > start then
        return start + amount
    else
        return start - amount
    end
end

local x = 3
local y = 10
local increment = 2

print(moveTowards(x, y, increment)) -- Output: 5

-- If the difference between x and y is less than increment, the function will return y.
print(moveTowards(x, y, increment)) -- Output: 10
```