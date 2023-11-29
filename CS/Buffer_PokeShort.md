## Buffer.PokeShort
This method inserts a single short integer into a memory buffer.

### Syntax
```c#
void PokeShort(ulong pos, ushort i)
```

| Parameter | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **i** | value to insert |

### Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

### Example
```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        Buffer buffer = new Buffer(20 * sizeof(short));

        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(short); ++n)
        {
            buffer.PokeShort((ulong)(n * sizeof(short)), (ushort)(n + 1));
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(short); ++n)
        {
            Print(buffer.PeekShort((ulong)(n * sizeof(short))));
        }
    }
}
```