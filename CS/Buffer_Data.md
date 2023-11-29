# Buffer.Data
This method retrieves a pointer to the buffer's allocated memory block.

## Syntax
- ```csharp
  IntPtr **Data**();
  ```

## Returns
Returns a pointer to the allocated block of memory, or returns NULL is no memory is allocated.

## Remarks
This method exposes low-level memory allocations. If possible it is better to use the [Buffer.Copy](Buffer_Copy.md) method, which has more built-in error checking.

The pointer this method returns may become invalid if the buffer is resized. To prevent errors, this method should be called each time the pointer is used. Do not store the returned pointer in a variable to be reused.

## Example

```csharp
using System;
using System.Runtime.InteropServices;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        IntPtr buffer = CreateBuffer(16);
        PokeInt(buffer, 0, 1);
        PokeInt(buffer, 4, 2);
        PokeInt(buffer, 8, 3);
        PokeInt(buffer, 12, 4);

        //Copy the buffer contents to an array
        int[] arr = new int[4];
        Marshal.Copy(buffer, arr, 0, arr.Length);

        //Display the results
        foreach (int i in arr)
        {
            Console.WriteLine(i);
        }

        Marshal.FreeHGlobal(buffer);

        Console.ReadLine();
    }

    [DllImport("UltraEngine.dll")]
    static extern IntPtr CreateBuffer(int size);

    [DllImport("UltraEngine.dll")]
    static extern void PokeInt(IntPtr buffer, int offset, int value);
}
```