# Stream.Read

This method reads a block of memory from a stream. This can be more efficient than reading one value at a time, and supports additional data types there is not an explicit read method for.

## Syntax

- ulong **Read**(Buffer data, ulong offset, ulong size)
- ulong **Read**(IntPtr data, ulong size)

| Parameter | Description |
| --- | --- |
| offset | offset in bytes from memory buffer beginning |
| data | buffer or pointer to read from |
| size | number of bytes to read |

## Returns

Returns the number of bytes that were read from the stream.

## Example

```c#
using System;
using static UltraEngine.UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        String path = GetPath(PATH_DOCUMENTS) + "/temp.bin";

        //Open a stream with read and write permissions
        DeleteFile(path);
        Stream stream = OpenFile(path);
        if (stream == null)
        {
            Print("Failed to write file.");
            return;
        }

        //Initialize data
        int[] data = new int[10];
        for (int n = 0; n < 10; ++n)
        {
            data[n] = 100 + n;
        }

        //Write data to the stream
        stream.Write(&data[0], (ulong)Marshal.SizeOf(data[0]) * (ulong)data.Length);

        //Change the stream positio
        stream.Seek(0);

        //Read back the data    
        stream.Read(&data[0], (ulong)Marshal.SizeOf(data[0]) * (ulong)data.Length);

        for (int n = 0; n < 10; ++n)
        {
            Print(data[n]);
        }
    }
}
```