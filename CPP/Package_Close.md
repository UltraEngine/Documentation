# Package::Close

This method will flush any queued changes and close the package.

## Syntax

- bool **Close**()

## Returns

Returns true if the package is closed successfully, otherwise false is returned.

If there are open streams writing to the package, false will be returned.

If the package file cannot be written to, false will be returned.
