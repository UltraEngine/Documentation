# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ and C# programs.

## Properties

| Name | Type | Description |
|-----|-----|-----|
| [ExecuteString](ExecuteString.md) | Function | |
| [GetLuaState](GetLuaState.md) | Function | |
| [RunScript](RunScript.md) | Function | |
| [PollDebugger](PollDebugger.md) | Function | |

## Debugging Lua Scripts

You can use [Visual Studio Code](https://code.visualstudio.com) to debug Lua scripts in your game. The project template includes launch settings that will appear when you open the project template in Visual Studio Code. When you select the debug launch option, the -debug command line switch will be passed to your game's executable. 

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
Alternatively, you can call PollDebugger() in your main loop in Lua.

Although by default the project is set to debug scripts using the debug build of your game, it is also possible to run the Lua debugger in release mode.

## Exposing C++ classes to Lua

Ultra Engine uses the [sol2](https://github.com/ThePhD/sol2) library to expose C++ classes and functions to Lua. It's most convenient to add a static function to each class you want to expose to Lua, called BindClass:
```c++
class Monster
{
public:
  int health;
  void Update();
  static void BindClass(sol::state* L);
};

extern shared_ptr<Monster> CreateMonster(shared_ptr<World> world, int health = 100);
```

The Monster::BindClass function definition looks like this:
```cpp
static void Monster::BindClass(sol::state* L)
{
  L->new_usertype<Monster>
  (
    "Monster",
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

```
L->new_usertype<Monster>
(
  "Monster",
  "Attack", sol::overload(
    sol::resolve<void(shared_ptr<Player>)>(&Attack),
    sol::resolve<void(shared_ptr<NPC>)>(&Attack)
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

### NULL Shared Pointers

Shared pointer function parameters that are allowed to have a value of NULL must be implemented using a raw pointer. The [Object::As](Object_As.md) method can be used to retrieve the object's shared pointer.

```cpp
L->set_function("CreateMonster",
    [](World* w) { if (w == NULL) return CreateMonster(NULL); return CreateMonster(w->As<World>()); }
);
```

**Do not** call make_shared() to create a new shared pointer, as this will result in the premature deletion of the object.

If NULL is not considered a valid value for the parameter, you can skip this and just use the shared pointer in your function definition.

### String Values

### Class Hierarchy

### Casting Types

### Getters and Setters

### Debugging User-defined Classes
