# ExecuteString

This function executes a string of text instead of a file.

## Syntax

- bool **ExecuteString**(string source)

| Parameter | Description |
|---|---|
| source | script code to execute |

## Returns

Returns true if the string was successfully executed, otherwise false is returned.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        ExecuteString("Notify('Hello!')");
    }
}
```