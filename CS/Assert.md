# Assert
This function produces a runtime error if the supplied condition or object is false or NULL.

## Syntax

- **void Assert**(bool condition)
- **void Assert**(bool condition, WString message)
- **void Assert**(Object o)
- **void Assert**(Object o, WString message) 

| Parameter | Description |
|---|---|
| condition | if false a runtime error is generated |
| o | if NULL a runtime error is generated |
| message | error message to display |

## Example
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        try
        {
            Assert(false);
        }
        catch (Exception e)
        {
            string error = e.Message;
            System.Diagnostics.Debugger.Break();
        }
    }
}
```