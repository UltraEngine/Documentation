# Buffer.PeekDouble #
This method returns a double float value from the memory buffer.

## Syntax ##
- double **PeekDouble**(ulong pos)

### Parameters ###
| Name | Description |
| ---- | ----------- |
| pos  | offset from the start of the buffer, in bytes |

## Returns ##
Returns a double float value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        Buffer buffer = CreateBuffer(20 * sizeof(Double));
        
        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(Double); ++n)
        {
            buffer.PokeDouble(n * sizeof(Double), n + 1);
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(Double); ++n)
        {
            Console.WriteLine(buffer.PeekDouble(n * sizeof(Double)));
        }
    }
}
```