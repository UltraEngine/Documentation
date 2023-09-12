# Random

This function returns a pseudorandom value within the specified range. If no range is specified, the result will be between 0 and 1.

## Syntax

`Random(maxima: number): number`

`Random(minima: number, maxima: number): number`

## Parameters

- `minima` (optional): The minimum value that can be returned.
- `maxima`: The maximum value that can be returned.

## Returns

Returns a pseudorandom number.

## Example

```lua
SeedRandom(Millisecs())

Print(Random())
Print(Random(10))
Print(Random(10, 20))
```