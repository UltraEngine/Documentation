# WString:Left
This method returns the leftmost characters of the wide string.

## Syntax
```lua
WString:Left(count)
```

## Parameters
- **count** (number): The maximum number of characters to return.

## Returns
- (string): The leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example

```lua
local s = WString("Hello, how are you today?")
Print(s:Left(5))
```