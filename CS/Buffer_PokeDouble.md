# Buffer.PokeDouble
This method inserts a double float value into the memory buffer.

## Syntax
- void **PokeDouble**(ulong pos, double f)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| f | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Create a buffer
        var buffer = CreateBuffer(20 * sizeof(double));

        // Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(double); ++n)
        {
            buffer.PokeDouble(n * sizeof(double), n + 1);
        }

        // Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(double); ++n)
        {
            Console.WriteLine(buffer.PeekDouble(n * sizeof(double)));
        }

        return 0;
    }
}
```