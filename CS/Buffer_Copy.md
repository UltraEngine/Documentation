# Buffer.Copy

This method copies the contents of this buffer to another one.

## Syntax

- void **Copy**(ulong srcoffset, [Buffer](Buffer.md) dst, ulong dstoffset, ulong size)

| Parameter | Description |
| ----- | ----- |
| srcoffset | offset for the source buffer data, in bytes |
| dst | destination buffer |
| dstoffset | offset for the destination buffer data, in bytes | 
| size | number of bytes to copy |

## Remarks

A runtime error will occur if the source or destination range lies outside of the buffer extents.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create two buffers
        int[] arr = { 0,1,2,3,4,5,6,7,8,9 };
        var buffer1 = CreateStaticBuffer(arr, arr.Length * sizeof(int));
        var buffer2 = CreateBuffer(4 * sizeof(int));

        //Copy part of the buffer contents
        buffer1.Copy(3 * sizeof(int), buffer2, 0, buffer2.GetSize());

        //Display the copied contents
        for (int n = 0; n < 4; ++n)
        {
            Console.WriteLine(buffer2.PeekInt(n * sizeof(int)));
        }
    }
}
```