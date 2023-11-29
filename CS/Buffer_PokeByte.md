# Buffer.PokeByte
This method inserts a single byte into a memory buffer.

## Syntax
```csharp
void PokeByte(ulong pos, byte b)
```

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| b | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        var buffer = CreateBuffer(20 * sizeof(char));
        
        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(char); ++n)
        {
            buffer.PokeByte((ulong)n, (byte)(n + 1));
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(char); ++n)
        {
            Console.WriteLine(buffer.PeekByte((ulong)n));
        }
    }
}
```