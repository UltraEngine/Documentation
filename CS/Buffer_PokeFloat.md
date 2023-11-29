```csharp
using System;
using UltraEngine;

class Program
{
	static void Main(string[] args)
	{
		//Create a buffer
		var buffer = CreateBuffer(20 * sizeof(float));
	
		//Poke data to the buffer
		for (int n = 0; n < buffer.GetSize() / sizeof(float); ++n)
		{
			buffer.PokeFloat(n * sizeof(float), n + 1);
		}

		//Peek and display data from the buffer
		for (int n = 0; n < buffer.GetSize() / sizeof(float); ++n)
		{
			Console.WriteLine(buffer.PeekFloat(n * sizeof(float)));
		}
	}
}
```