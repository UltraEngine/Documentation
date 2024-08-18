# GetMemoryUsage

This function returns the size of all allocated memory the program uses.

## Syntax

- uint64_t **GetMemoryUsage**()

## Returns

Returns the amount of memory the program uses, in bytes.

## Remarks

This function will only return the exact memory usage in debug builds.

In debug builds, this function can be very slow and should not be called every frame.
