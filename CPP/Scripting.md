# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ code.

| Function | Description |
|-----|-----|
| [ExecuteString](ExecuteString.md) | executes script code |
| [GetLuaState](GetLuaState.md) | retrieves the game engine's Lua state |
| [PollDebugger](PollDebugger.md) | syncs information with the debugger |
| [RunScript](RunScript.md) | executes a script file |

## Debugging Lua Scripts

You can use [Visual Studio Code](https://code.visualstudio.com) with the [Lua Debugger](https://marketplace.visualstudio.com/items?itemName=devCAT.lua-debug) extension to debug Lua scripts in your game. The project template includes launch settings that will appear when you open the project template in Visual Studio Code. When you select the debug launch option, the -debug command line switch will be passed to your game's executable. 

Your game needs to interpret the command line switch and activate the debugger when the -debug option is specified. To do this, the debugger script must be run so the program can communicate with the IDE:
```c++
int main(int argc, const char* argv[])
{
    //Get command-line options
    auto cl = ParseCommandLine(argc, argv);

    //Enable script debugging if the -debug switch is specified
    if (cl["debug"].is_boolean() and cl["debug"] == true)
    {
        RunScript("Scripts/Modules/Debugger.lua");
    }
```
Additionally, your program must periodically call the function [PollDebugger](PollDebugger.md) to receive updates from the IDE. This can be done with a timer in C++:
```c++
//Create a timer
auto timer = CreateTimer(510);

//Poll the debugger every timer tick
ListenEvent(EVENT_TIMERTICK, timer, std::bind(&PollDebugger, 500));
```
Alternatively, you can call the PollDebugger function in your main loop in Lua:
```lua
--Main loop
while window:KeyDown(KEY_ESCAPE == false) do
    PollDebugger()
    world:Update()
    world:Render(framebuffer)
end
```

Although by default the project is set to debug scripts using the debug build of your game, it is also possible to run the Lua debugger in release mode.

## User-defined C++ Classes in Lua

Ultra Engine uses the [sol](https://github.com/ThePhD/sol2) library to expose C++ classes and functions to Lua. It's most convenient to add a static function to each class you want to expose to Lua, called BindClass:

```c++
class Monster : public Object
{
public:
  int health;
  void Update();
  static void BindClass(sol::state* L);
};

extern shared_ptr<Monster> CreateMonster(shared_ptr<World> world, int health = 100);
```

The Monster::BindClass function definition would look like this:

```cpp
static void Monster::BindClass(sol::state* L)
{
  L->new_usertype<Monster>
  (
    "MonsterClass",
    "health", &health,
    "Update", &Update
  );
  L->set_function("CreateMonster", &CreateMonster);
}
```

At the beginning of your program you can bind the class by calling the function:

```c++
auto L = GetLuaState();
Monster::BindClass(L);
```

### Function Overloading

You can specify multiple versions of a functon or method using the sol::overload function. Let's say our class has two versions of a method:

```c++
virtual void Attack(shared_ptr<Player> player);
virtual void Attack(shared_ptr<Villager> villager);
```

You can use sol::resolve to specify each function protocol:

```c++
L->new_usertype<Monster>
(
  "MonsterClass",
  "Attack", sol::overload(
    sol::resolve<void(shared_ptr<Player>)>(&Attack),
    sol::resolve<void(shared_ptr<Villager>)>(&Attack)
  )
);
```

Alternatively, you can use a Lambda function to create function overloads:

```c++
L->new_usertype<Monster>
(
  "MonsterClass",
  "Attack", sol::overload(
    [](Monster& m, shared_ptr<Player> p) { m.Attack(p); },
    [](Monster& m, shared_ptr<Villager> v) { m.Attack(v); }
  )
);
```

### Default Parameters

Default parameters are not supported directly, but can be implemented using function overloading as follows: 

```cpp
L->set_function("CreateMonster", sol::overload(
  [](shared_ptr<World> world){ return CreateMonster(world); },
  [](shared_ptr<World> world, int health){ return CreateMonster(world, health); }
));
```

### Shared Pointers

For the most part, shared pointers will work seamlessly with sol. However, the Lua nil value cannot be mapped to a shared pointer. If you have a shared pointer parameter that is allowed to be NULL, specify an overload for this case:

```cpp
L->set_function("CreateMonster",
	sol::overload(
		[](std::shared_ptr<World> w) { return CreateMonster(w); },
		[](std::nullptr_t) { return CreateMonster(nullptr); }
	)		
);
```

If NULL is not considered a valid value for the parameter, you can skip the extra overload and just use the shared pointer in your function definition. In that case, an error will occur if a script attempts to call the function with a nil value.

### Inheritance

To support inheritance, define base classes in the class definition. Each inherited class should be specified:

```c++
L->new_usertype<Vampire>
(
    "VampireClass",
    sol::base_classes, sol::bases<Object, Monster>()
);
```

You should also define the SOL_BASE_CLASSES macro in your header file. Note that the class namespaces must be explicitly defined:

```c++
SOL_BASE_CLASSES(Vampire, Monster, UltraEngine::Object);
```

Note that this macro must be placed *outside* of any namespace.

### Casting Types

It's best to make a cast function for each class, and include an overload that handles nil values:

```c++
L->set_function("Monster",
	[](shared_ptr<Object> o){ return o->As<Monster>(); },
	[](std::nullptr_t) { return nullptr; }
);
```

Because we are using the class name for this function, you should call the exposed class something different like "MonsterClass".

### Getters and Setters

You can specify getter and setter class methods using the sol::property feature:

```cpp
static void Monster::BindClass(sol::state* L)
{
  L->new_usertype<Monster>
  (
    "MonsterClass",
    "health", sol::property([](Monster& m, int h){ m.SetHealth(h); }, [](Monster& m){ return m.GetHealth(); }, )
  );
  L->set_function("CreateMonster", &CreateMonster);
}
```

You can use sol::property to create read-only class members:

```cpp
static void Monster::BindClass(sol::state* L)
{
  L->new_usertype<Monster>
  (
    "MonsterClass",
    "birthdate", sol::property([](Monster& m){ return m.birthdate; }, )
  );
}
```

### Strings

Ultra Engine uses wide strings wherever possible. Lua only supports narrow strings, but UTF-8 text can be encoded in them.

When a C++ function is called from Lua, if it is possible for the returned string to contain special characters, the function should always return a wide string converted to UTF-8:

```c++
L->set_function("CurrentDir",
	[](){ return std::string( CurrentDir().ToUtf8String() ); }
);
```

Any C++ function that accepts a string from Lua should assume the string is using UTF-8 encoding and convert to a wide string:

```c++
L->set_function("Notify",
	[](std::string s){ Notify( WString(s) ); }
);
```

File and memory write functions that read and write narrow strings are an exception to this rule and should use a narrow string:

```c++
"WriteString", [](Stream& s, std::string& t){ s.WriteString(t) },
"ReadString", [](Stream& s){ return std::string(s.ReadString()) }
```

Class properties can be handled in the same manner:

```c++
"name", sol::property(
	[](Monster& m) { return std::string(m.name.ToUtf8String() ); },
	[](Monster& m, std::string&) { m.name = WString(s); }
)
```

Here is a simple test that demonstrates wide strings in Lua with concatenation:

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    auto L = GetLuaState();
    L->set("a", std::string(WString(L"Сколько").ToUtf8String()) );
    L->set("b", std::string(WString(L"вам").ToUtf8String()) );
    L->set("c", std::string(WString(L"лет").ToUtf8String()) );
    ExecuteString("Print(a..\" \"..b..\" \"..c..\"?\")");
    return 0;
}
```

Following these rules will allow your program to support other languages and run correctly on computers in other geographical regions.

### Debugging User-defined Classes

You can add additional user-defined debugging information by adding a method called debug to your class and exposiing it:

```c++
sol::table Monster::debug(sol::this_state ts) const
{
    auto t = Object::debug(ts);
    t["health"] = health;
    return t;
}
```

## Lua Modules

Lua modules allow scripts to execute code from dynamically linked libraries. You can use the version of Lua found [here](https://github.com/UltraEngine/Lua5.4) to build modules for use with Ultra Engine. Lua modules should be placed in the "Scripts/Modules" subfolder in your game's directory.

## Additional Information

- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)
- [sol Documentation](https://sol2.readthedocs.io/en/latest/)
