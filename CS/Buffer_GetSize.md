# Buffer.GetSize

This method retrieves the size of the allocated memory block.

## Syntax

```csharp
ulong **GetSize**()
```

## Returns

Returns the size of the allocated memory block, in bytes.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        Buffer buffer = CreateBuffer(10);

        //Resize the buffer
        buffer.Resize(20);

        //Get the buffer size
        Console.WriteLine(buffer.GetSize());

        return;
    }
}
```