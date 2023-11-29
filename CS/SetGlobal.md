# SetGlobal

## Syntax

- void **SetGlobal**(const [String](String.md)& name, const [object](object.md)& value)

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        // Get the Lua state
        Lua lua = new Lua();

        // Set a global variable
        lua.SetGlobal("testvalue", "Hello");

        // Run a script that accesses and modifies the variable
        lua.ExecuteString("Print(testvalue) testvalue = testvalue..'!'");

        // Retrieve the variable
        var o = lua.GetGlobal("testvalue");

        // Cast the result to a string and display
        if (o is string)
        {
            string s = (string)o;
            Print(s);
        }
        else
        {
            Print("Variable is not a string.");
        }
    }
}
```