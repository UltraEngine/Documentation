```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        Vec3 v0 = new Vec3(1, 0, 0);
        Vec3 v1 = new Vec3(-1, 0, 0);

        Console.WriteLine(v0.Dot(v1));
    }
}
```