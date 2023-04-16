# Object::SetField

This method sets a field on the object in the Lua virtual machine.

## Syntax

- sol::object **SetField**(const [WString](WString.md)& name, const sol::autoobject& value)

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
