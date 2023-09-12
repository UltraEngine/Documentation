# AppDir

This function returns the path of the folder the application executable is in. This will return the executable's folder, even if the program is launched with a different working directory.

## Syntax

- **AppDir**() -> string

## Returns

Returns the starting folder the application is launched in.

## Example

```lua
Print(AppDir())
```