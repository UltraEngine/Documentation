# Buffer.Clear()
When a buffer is first created its contents are random. This method sets each byte in the allocated memory block to zero.

## Syntax ##
- void **Clear**()

## Example ##
```csharp
using System;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var buffer = new Buffer(4);
            Console.WriteLine("Initial contents: " + buffer.PeekInt(0));
            buffer.Clear();
            Console.WriteLine(buffer.PeekInt(0));
        }
    }
}
```