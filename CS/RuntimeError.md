# RuntimeError #
This function generates a critical error and exits the program.

## Syntax ##
- void **RuntimeError**(const [WString](WString.md)& message)

| Parameter | Description |
| --- | --- |
| message | error message to print |

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        try
        {
            RuntimeError("Something went wrong!");
        }
        catch (Exception e)
        {
            WString error = e.Message.ToWString();
            DebugBreak();
        }
    }
}
```