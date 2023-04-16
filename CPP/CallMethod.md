# CallMethod

This function performs a method-style function call with any object.

## Syntax

- [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) **CallMethod**(shared_ptr<T\> o, const [WString](WString.md)& name, const std::vector< [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) \>& args = {} )
- bool **CallMethod**(shared_ptr<T\> o, const [WString](WString.md)& name, const std::vector< [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) \>& args, std::vector< [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) \>& returnvalues)

| Parameter | Description |
|---|---|
| o | object to call the method for, must be derived from [Object](Object.md) |
| name | name of the method |
| args | method arguments |
| returnvalues | return values will be stored here |

## Returns

The first overload returns a single return value.

The second overload returns true if the method was successfully executed, otherwise false is returned.

## Syntax

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Create an object
    auto box = CreateBox(NULL);
    box->name = "Bob";

    //Declare a variable in Lua
    SetGlobal("entity", box);

    //Run a script that attaches a function to the entity
    ExecuteString("function entity:Rename( newname ) self.name = newname end");

    //Call the method
    CallMethod(box, "Rename", { "Fred" });

    //Check if it worked
    Print(box->name);

    return 0;
}
```
