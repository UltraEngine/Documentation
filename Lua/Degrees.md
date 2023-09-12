# Degrees

This function converts an angle from radians to degrees.

## Syntax

- number **Radians**(number angle)

## Parameters

- `angle`: angle in radians

## Returns

Returns the angle, converted to degrees.

## Example

```lua
local a = 45
local r = Radians(a)
Print(r)
Print(Degrees(r))
```

In the example above, we first define a variable `a` and set it to 45. Then, we use the `Radians` function to convert `a` to radians and store the result in the variable `r`. Finally, we print the value of `r` and the result of calling the `Degrees` function with `r` as the argument.