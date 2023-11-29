# `CreateBufferStream`

This function creates a new `BufferStream` object that allows read and writing to a block of memory as if it were a file.

## Syntax
- `BufferStream` **CreateBufferStream**(`Buffer` data = null, [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string) path = "")

| Parameter | Description |
| --- | --- |
| data | can be used to specify an existing data buffer for the stream to use |
| path | sets the Stream path member to simulate a file |

## Returns
Returns a new `BufferStream` object.

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Create a memory buffer and fill in some data
        var buffer = new Buffer(10 * sizeof(int));
        for (int n = 0; n < 10; ++n)
        {
            buffer.PokeInt(n * sizeof(int), n);
        }

        //Create a buffer stream
        var stream = CreateBufferStream(buffer);

        //Read from the memory buffer as if it were a file
        while (!stream.EoF())
        {
            Console.WriteLine(stream.ReadInt());
        }

        return 0;
    }
}
```