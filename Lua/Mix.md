# Mix

This function performs a linear interpolation and returns the result.

## Syntax

- number **Mix**(number value0, number value1, number d)

| Parameter | Description |
| --- | --- |
| value0 | first value |
| value1 | second value |
| d | interpolation amount |

## Returns

Returns the result of the linear interpolation.

## Example
```lua
Mix = function(value0, value1, d)
    return value0 + (value1 - value0) * d
end

print(Mix(10.0, 20.0, 0.75))
```
