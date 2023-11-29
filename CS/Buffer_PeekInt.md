```csharp
using System;

public class Program
{
    public static void Main(string[] args)
    {
        //Create a buffer
        var buffer = new Buffer(20 * sizeof(int));
        
        //Poke data to the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(int); ++n)
        {
            buffer.PokeInt(n * sizeof(int), n + 1);
        }

        //Peek and display data from the buffer
        for (int n = 0; n < buffer.GetSize() / sizeof(int); ++n)
        {
            Console.WriteLine(buffer.PeekInt(n * sizeof(int)));
        }
    }
}

public class Buffer
{
    private byte[] data;
    
    public Buffer(int size)
    {
        data = new byte[size];
    }
    
    public int GetSize()
    {
        return data.Length;
    }
    
    public void PokeInt(int pos, int value)
    {
        // Convert int to bytes
        byte[] bytes = BitConverter.GetBytes(value);
        
        // Copy bytes to buffer
        Array.Copy(bytes, 0, data, pos, sizeof(int));
    }
    
    public int PeekInt(int pos)
    {
        // Get bytes from buffer
        byte[] bytes = new byte[sizeof(int)];
        Array.Copy(data, pos, bytes, 0, sizeof(int));
        
        // Convert bytes to int
        return BitConverter.ToInt32(bytes, 0);
    }
}
```