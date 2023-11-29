# Buffer.PeekFloat
This method returns a float value from the memory buffer.

## Syntax
```csharp
float PeekFloat(ulong pos)
```

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns
Returns a float value.

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
        // Create a buffer
        var buffer = new Buffer(20 * sizeof(float));

        // Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(float); ++n)
        {
            buffer.PokeFloat((ulong)(n * sizeof(float)), n + 1);
        }

        // Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(float); ++n)
        {
            Console.WriteLine(buffer.PeekFloat((ulong)(n * sizeof(float))));
        }
    }
}
```