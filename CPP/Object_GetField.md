# Object::GetField

This method gets a field on the object in the Lua virtual machine.

## Syntax

- [sol::object](https://sol2.readthedocs.io/en/latest/api/object.html) **GetField**(const [WString](WString.md)& name)

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

    //Create an object
    auto box = CreateBox(NULL);

    //Set a field
    box->SetField("health", 100);

    //Retrieve the value
    auto o = box->GetField("health");
    if (o.is<double>())
    {
        Print(o.as<double>());
    }
    
    return 0;
}
