# SetGlobal

## Syntax

- void **SetGlobal**(const [WString](WString.md)& name, const sol::object& value)

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the sol state
    auto lua = GetLuaState();

    //Get the Lua state
    auto L = lua->lua_state();

    //Set a global variable
    SetGlobal("testvalue", sol::make_object(L, "Hello"));

    //Run a script that accesses and modifies the variable
    ExecuteString("Print(testvalue) testvalue = testvalue..'!'");

    //Retrieve the variable
    auto o = GetGlobal("testvalue");

    //Cast the result to a string and display
    if (o.is<std::string>())
    {
        std::string s = o.as<std::string>();
        Print(s);
    }
    else
    {
        Print("Variable is not a string.");
    }

    return 0;
}
```
