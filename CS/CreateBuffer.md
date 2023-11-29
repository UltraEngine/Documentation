# CreateBuffer

This function creates a new memory buffer object.

## Syntax

- **Buffer** CreateBuffer(uint64_t size)

| Parameter | Description |
| ---- | ---- |
| **size** | size of the allocated memory block |

## Returns

If the memory is allocated successfully, a new buffer object is returned, otherwise NULL is returned.

## Example

```csharp
using System;
using UltraEngine;

namespace GameEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            //Create a buffer
            Buffer buffer = CreateBuffer(20 * sizeof(char));

            //Poke data to the buffer
            for (int n = 0; n < buffer.GetSize() / sizeof(char); ++n)
            {
                buffer.PokeByte(n, (byte)(n + 1));
            }

            //Peek and display data from the buffer
            for (int n = 0; n < buffer.GetSize() / sizeof(char); ++n)
            {
                Console.WriteLine(buffer.PeekByte(n));
            }

            return 0;
        }
    }
}
```