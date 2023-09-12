# WString:ToString
This method converts the wide string to a narrow string and returns it. Narrow to wide string conversion is automatic, but wide to narrow conversion may cause characters to be lost and must be called explicitly.

## Syntax
**function WString:ToString()** -> String

## Returns
Returns a narrow string.

## Example

```lua
ws = WString("Hello, how are you today?")
s = ws:ToString()

Print(ws)
if ws == s then
    Print("Short string matches wide string")
else
    Print("Short string does not match wide string")
end

Print("")

ws = WString("你好，你今天好吗？")
s = ws:ToString()

Print(ws)
if ws == s then
    Print("Short string matches wide string")
else
    Print("Short string does not match wide string")
end
```