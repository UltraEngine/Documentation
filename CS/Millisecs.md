# Millisecs

This function returns the current system time, in milliseconds.

## Syntax

- ulong **Millisecs**()

## Returns

Returns the current system time, in milliseconds.

## Example

```csharp
using System;
					
public class Program
{
	public static void Main()
	{
		//Get the initial system time
		ulong starttime = Millisecs();
		
		//Pause for one second
		System.Threading.Thread.Sleep(1000);
		
		//Show the current time relative to the starting time
		ulong currenttime = Millisecs() - starttime;
		Console.WriteLine(currenttime);
		
		//Pause for one second
		System.Threading.Thread.Sleep(1000);
		
		//Show the current time relative to the starting time
		currenttime = Millisecs() - starttime;
		Console.WriteLine(currenttime);
	}
	
	private static ulong Millisecs()
	{
		return (ulong)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds;
	}
}	
```