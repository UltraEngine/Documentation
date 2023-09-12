# Clamp

This function constrains a value between a lower and upper limit.

## Syntax

- **Clamp**(value: number, minimum: number, maximum: number): number

Parameters:

- **value**: the value to constrain.
- **minimum**: the lower limit of the return value.
- **maximum**: the upper limit of the return value.

## Returns

The closest value to the input value that is between the specified minimum and maximum will be returned.

## Example

```lua
Clamp(307, 0, 255)
```

Note: The required libraries have been assumed to be already imported.