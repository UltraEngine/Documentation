# ExecuteString

This function executes a string of text instead of a file.

## Syntax

```
ExecuteString(source)
```

## Parameters

- `source` (String): script code to execute

## Returns

Returns `true` if the string was successfully executed, otherwise `false` is returned.

## Example

```lua
-- Assume required libraries are already imported
ExecuteString("Notify('Hello!')")
```