```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        var buffer = new Buffer(20 * sizeof(char));
        
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