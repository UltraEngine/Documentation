# CallFunction

## Syntax

- bool **CallFunction**(const [WString](WString.md)& name, const std::vector< sol::object \>& args, std::vector< sol::object \>& results)
- bool **CallFunction**(const sol::protected_function& func, const std::vector< sol::object \>& args, std::vector< sol::object \>& results)

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

    //Run a script that declares a function
    ExecuteString("function MyFunc( a, b ) return a + b end");

    //Arguments and return values
    std::vector<sol::object> arguments = { sol::make_object(L, 3), sol::make_object(L, 2) };
    std::vector<sol::object> returnvalues;
    
    //Execute the function
    if (CallFunction("MyFunc", arguments, returnvalues))
    {
        Print(String(returnvalues.size()) + " return values");

        //Get the return values
        for (auto val : returnvalues)
        {
            if (val.is<bool>())
            {
                Print(val.as<bool>());
            }
            else if (val.is<double>())
            {
                Print(val.as<double>());
            }
            else if (val.is<std::string>())
            {
                Print(val.as<std::string>());
            }
            else
            {
                Print("Unknown type");
            }
        }
    }
    else
    {
        Print("Failed to call function");
    }

    return 0;
]
```
