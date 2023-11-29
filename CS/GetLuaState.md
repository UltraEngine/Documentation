# GetLuaState

This function returns the sol Lua state, for low-level usage.

## Syntax

- [sol::state](https://sol2.readthedocs.io/en/latest/api/state.html)* **GetLuaState**()

## Returns

Returns the game engine's sol lua state.

## Remarks

This is an advanced feature. See the Lua and sol documentation for more information:
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)
- [sol Documentation](https://sol2.readthedocs.io/en/latest/)

## Example

```csharp
using System;
using SolLuaState = Lua;

class Program
{
    static SolLuaState.State GetLuaState()
    {
        return SolLuaState.GetLuaState();
    }

    static void Main(string[] args)
    {
        SolLuaState.State lua = GetLuaState();

        // sol API example
        lua.Set("MyValue", 3);
        int value = lua.Get<int>("MyValue");
        Console.WriteLine(value);

        // Lua API example
        SolLuaState.Lua_State L = lua.LuaState();
        L.lua_pushstring("Fred");
        L.lua_setglobal("name");
        L.lua_getglobal("name");
        if (L.lua_isstring(-1))
        {
            string s = L.lua_tostring(-1);
            Console.WriteLine(s);
        }
        else
        {
            Console.WriteLine("Value is not a string.");
        }

        Console.ReadLine();
    }
}
```