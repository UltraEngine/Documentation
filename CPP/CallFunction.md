# CallFunction

This command executes a Lua function call.
 
## Syntax

- [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) **CallFunction**(const [WString](WString.md)& name, const std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& args = {} )
- bool **CallFunction**(const [WString](WString.md)& name, const std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& args, std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& results)
- bool **CallFunction**(const [sol::protected_function](https://sol2.readthedocs.io/en/latest/api/protected_function.html)& func, const std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& args, std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& results)

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

// Function for showing return values
void DisplayReturnValue(sol::object val)
{
    if (not val.valid()) return;
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

int main(int argc, const char* argv[])
{
    //Run a script that declares a function
    ExecuteString("function MyFunc( a, b ) return a + b end");

    //-------------------------------------------------------------------------------------------
    // First, call function the easy way
    //-------------------------------------------------------------------------------------------

    auto result = CallFunction("MyFunc", { 3, 2 });
    
    //Print the result
    DisplayReturnValue(result);

    //-------------------------------------------------------------------------------------------
    // Now, call function the advanced way - Handles multiple return values and function errors
    //-------------------------------------------------------------------------------------------

    //Store return values
    std::vector<sol::object> returnvalues;
    
    //Execute the function
    if (CallFunction("MyFunc", { 3, 2 }, returnvalues))
    {
        Print(String(returnvalues.size()) + " return values");

        //Get the return values
        for (auto val : returnvalues)
        {
            DisplayReturnValue(val);
        }
    }
    else
    {
        Print("Failed to call function");
    }

    return 0;
]
```
