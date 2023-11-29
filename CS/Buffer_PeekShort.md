# Buffer.PeekShort
This method returns a short integer from the memory buffer.

## Syntax
- ushort **PeekShort**(ulong pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns
Returns a short integer value.

## Remarks
A runtime error will occur if the read range lies outside of the buffer extents.

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        Buffer buffer = Engine.CreateBuffer(20 * sizeof(short));
        
        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(short); ++n)
        {
            buffer.PokeShort(n * sizeof(short), (short)(n + 1));
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(short); ++n)
        {
            Console.WriteLine(buffer.PeekShort(n * sizeof(short)));
        }
    }
}
```