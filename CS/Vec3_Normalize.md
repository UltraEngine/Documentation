```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Vec3 v = new Vec3(1, 2, 4);
        v = v.Normalize();
        Print(v.x + ", " + v.y + ", " + v.z);
    }
}
```