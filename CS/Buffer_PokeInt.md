# Buffer.PokeInt
This method inserts a single integer into a memory buffer.

## Syntax
- void **PokeInt**(ulong pos, int i)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| i | value to insert |

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
        Buffer buffer = new Buffer(20 * sizeof(int));

        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(int); ++n)
        {
            buffer.PokeInt((ulong)(n * sizeof(int)), n + 1);
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(int); ++n)
        {
            Console.WriteLine(buffer.PeekInt((ulong)(n * sizeof(int))));
        }
    }
}
```