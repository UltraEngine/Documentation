# WString.ToString
This method converts the wide string to a narrow string and returns it. Narrow to wide string conversion is automatic, but wide to narrow conversion may cause characters to be lost and must be called explicitly.

## Syntax
- [String](String.md) **ToString**()

## Returns
Returns a narrow string.

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        WString ws = "Hello, how are you today?";
        string s = ws.ToString();

        Print(ws);
        if (ws == s)
        {
            Print("Short string matches wide string");
        }
        else
        {
            Print("Short string does not match wide string");
        }

        Print("");

        ws = "你好，你今天好吗？";
        s = ws.ToString();

        Print(ws);
        if (ws == s)
        {
            Print("Short string matches wide string");
        }
        else
        {
            Print("Short string does not match wide string");
        }
    }
}
```
