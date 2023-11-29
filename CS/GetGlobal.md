# GetGlobal

## Syntax

- **object** **GetGlobal**(WString name)

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the sol state
        var lua = GetLuaState();

        //Get the Lua state
        var L = lua.lua_state();

        //Set a global variable
        SetGlobal("testvalue", sol.make_object(L, "Hello"));

        //Run a script that accesses and modifies the variable
        ExecuteString("Print(testvalue) testvalue = testvalue + '!'");

        //Retrieve the variable
        var o = GetGlobal("testvalue");

        //Cast the result to a string and display
        if (o.is<string>())
        {
            string s = o.as<string>();
            Print(s);
        }
        else
        {
            Print("Variable is not a string.");
        }

        Console.ReadLine();
    }
}
```