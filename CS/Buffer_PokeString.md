# Buffer.PokeString

This method inserts a string into a memory buffer.

## Syntax
```csharp
void PokeString(ulong pos, string s);
```

| Parameter | Description |
| --------- | ----------- |
| `pos` | offset from the start of the buffer, in bytes |
| `s` | value to insert |

## Remarks
The buffer must have enough space to store the string plus an extra NULL character. A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        string s = "Hello, how are you today?";
        Buffer buffer = CreateBuffer((ulong)((s.Length + 1) * sizeof(char)));
        buffer.PokeString(0, s);
        Print(buffer.PeekString(0));
    }
}
```