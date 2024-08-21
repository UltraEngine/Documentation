# GetMemoryUsage

This function returns the size of all allocated memory the program uses.

## Syntax

- number **GetMemoryUsage**(boolean precise = false)

| Parameter | Description |
|---|---|
| precise | if set to true in debug builds, the exact memory usage will be returned |

## Returns

Returns the amount of memory the program uses, in bytes.

## Remarks

This function will only return the exact memory usage in debug builds when the precise argument is set to true.

In debug builds this function can be very slow when the precise argument is set to true, and should not be called every frame.

