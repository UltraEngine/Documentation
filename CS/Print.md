# Print

This function prints a line of text to the program output.

## Syntax

- void **Print**(string **value**, bool **linereturn** = true)
- void **Print**(string **value**, bool **linereturn** = true)
- void **Print**(int **value**, bool **linereturn** = true)
- void **Print**(float **value**, bool **linereturn** = true)
- void **Print**(double **value**, bool **linereturn** = true)

| Parameter | Description |
|---|---|
| value | string or data to display |
| linereturn | set to true to add a new line character at the end |

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Print("Hello, world!");
    }
}
```