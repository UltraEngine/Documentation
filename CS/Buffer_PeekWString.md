```csharp
using AlienEngine;

class Example
{
    static void Main(string[] args)
    {
        WString s = "Hello, how are you today?";
        Buffer buffer = new Buffer((s.Length + 1) * sizeof(char));
        buffer.PokeWString(0, s);
        Console.WriteLine(buffer.PeekWString(0));
    }
}
```