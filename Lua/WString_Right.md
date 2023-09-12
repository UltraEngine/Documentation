# WString::Right
This method returns the rightmost characters of the wide string.

#### Syntax
[WString](WString.md) **Right**(const int count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

#### Returns
Returns the rightmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

#### Example
```lua
s = WString("Hello, how are you today?")
Print(s:Right(6))
```