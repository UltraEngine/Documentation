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

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    sol::state* lua = GetLuaState();

    // sol API example
    lua->set("MyValue", 3);
    auto value = lua->get<int>("MyValue");
    Print(value);

    // Lua API example
    lua_State* L = lua->lua_state();
    lua_pushstring(L, "Fred");
    lua_setglobal(L, "name");
    lua_getglobal(L, "name");
    if (lua_isstring(L, -1))
    {
        std::string s = lua_tostring(L, -1);
        Print(s);
    }
    else
    {
        Print("Value is not a string.");
    }
    
    return 0;
}

```
