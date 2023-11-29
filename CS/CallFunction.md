# CallFunction

This command executes a Lua function call.

## Syntax

- [System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0) **CallFunction**(string name, List\<[System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0)>\ args = {} )
- bool **CallFunction**(string name, List\<[System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0)>\ args, out List\<[System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0)>\ results)
- bool **CallFunction**([sol.protected_function](https://sol2.readthedocs.io/en/latest/api/protected_function.html) func, List\<[System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0)>\ args, out List\<[System.Object](https://docs.microsoft.com/en-us/dotnet/api/system.object?view=net-6.0)>\ results)

## Example

```csharp
using System;
using System.Collections.Generic;
using ULTRAGEN;

public class Program
{
    // Function for showing return values
    public static void DisplayReturnValue(object val)
    {
        if (val == null) return;
        if (val is bool)
        {
            Console.WriteLine((bool)val);
        }
        else if (val is double)
        {
            Console.WriteLine((double)val);
        }
        else if (val is string)
        {
            Console.WriteLine((string)val);
        }
        else
        {
            Console.WriteLine("Unknown type");
        }
    }

    public static void Main(string[] args)
    {
        //Run a script that declares a function
        ULTRAGEN.ExecuteString("function MyFunc( a, b ) return a + b end");

        //-------------------------------------------------------------------------------------------
        // First, call function the easy way
        //-------------------------------------------------------------------------------------------

        var result = CallFunction("MyFunc", new List\<System.Object\> { 3, 2 });
    
        //Print the result
        DisplayReturnValue(result);

        //-------------------------------------------------------------------------------------------
        // Now, call function the advanced way - Handles multiple return values and function errors
        //-------------------------------------------------------------------------------------------

        //Store return values
        List\<System.Object\> returnvalues;
    
        //Execute the function
        if (CallFunction("MyFunc", new List\<System.Object\> { 3, 2 }, out returnvalues))
        {
            Console.WriteLine(returnvalues.Count + " return values");

            //Get the return values
            foreach (var val in returnvalues)
            {
                DisplayReturnValue(val);
            }
        }
        else
        {
            Console.WriteLine("Failed to call function");
        }
    }
}
```
