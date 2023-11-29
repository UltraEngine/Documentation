```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        float angle = -65.0f;

        float s = Math.Sin(angle);
        float c = Math.Cos(angle);
        float t = Math.Tan(angle);

        Console.WriteLine("Sin: " + Math.Asin(s));
        Console.WriteLine("Cos: " + Math.Acos(c));
        Console.WriteLine("Tan: " + Math.Atan(t));
    }
}
```