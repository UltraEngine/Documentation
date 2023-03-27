# Package::Close

This method will flush any queued changes and close the package.

## Syntax

- bool **Close**()

## Returns

Returns true if the package is closed successfully, otherwise false is returned.

If the package file cannot be written to, false will be returned.

## Remarks

This method can only be called once if successful. Files cannot be read from and written to after this method is called.

Packages are automatically closed upon deletion.
