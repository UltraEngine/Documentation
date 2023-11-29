```csharp
using System;
using UltraEngine;

public class Example
{
    static void Main(string[] args)
    {
        //Create an object
        Vec3 v = new Vec3(1, 2, 3);

        //Create static buffer
        var buffer = CreateStaticBuffer(ref v, (ulong)sizeof(Vec3));

        //Print out the contents. Make sure the variable v is still in scope when you do this!
        Console.WriteLine(buffer.PeekFloat((ulong)Marshal.OffsetOf<Vec3>("x")));
        Console.WriteLine(buffer.PeekFloat((ulong)Marshal.OffsetOf<Vec3>("y")));
        Console.WriteLine(buffer.PeekFloat((ulong)Marshal.OffsetOf<Vec3>("z")));
    }

    static Buffer CreateStaticBuffer(ref Vec3 data, ulong size)
    {
        throw new NotImplementedException();
    }
}
```
