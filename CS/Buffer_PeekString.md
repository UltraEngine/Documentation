```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
	    string s = "Hello, how are you today?";
	    Buffer buffer = CreateBuffer((s.Length + 1) * sizeof(s[0]));
	    buffer.PokeString(0, s);
	    Print(buffer.PeekString(0));
    }
}
```