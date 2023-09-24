# Random

This function returns a psuedorandom value within the specified range. If no range is specified, the result will be between 0 and 1.

## Syntax

- number **Random**(number maxima = 1.0f)
- number **Random**(number minima, number maxima)

| Parameter | Description |
|---|---|
| minima | minimum value that can be returned |
| maxima | maximum value that can be returned |

## Returns

Returns a psuedorandom number.

## Example

```lua
Seed(Millisecs())

Print(Random())
Print(Random(10))
Print(Random(10, 20))
```
