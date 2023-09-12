# WString:ToUtf8String

This method converts the wide string to a narrow string using UTF-8 encoding. This allows a narrow string to store a larger range of wide string characters in a narrow string. However, some string operations will not work correctly with a UTF-8 string.

## Syntax

`function WString:ToUtf8String() -> string`

## Returns

Returns a narrow string with UTF-8 encoding.

## Example

```lua
ws = WString(L"你好，你今天好吗？")
s = ws:ToString()

Print(s)
if ws == s then
    Print("Short string matches wide string")
else
    Print("Short string does not match wide string")
end

Print("")

s = ws:ToUtf8String()

Print(s)
if ws == s then
    Print("Short string matches wide string")
else
    Print("Short string does not match wide string")
end
```