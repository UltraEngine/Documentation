# Buffer.Resize
This method resizes the allocated memory block. The contents of the buffer will be retained in the new memory block.

## Syntax
- bool **Resize**(ulong size, bool padding = true)

| Parameter | Description |
| ----| ----|
| size | new size of the memory block |
| padding | if set to true the new block may be automatically padded internally for faster resizing |

## Returns
Returns true if the memory block is successfully resized, otherwise false is returned.

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        var buffer = new Buffer(10);

        //Resize the buffer
        buffer.Resize(20);

        //Get the buffer size
        Console.WriteLine(buffer.GetSize());

        //Print the buffer size
        Console.WriteLine(buffer.GetSize());

        //Dispose of the buffer
        buffer.Dispose();
    }
}
```