# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ and C# programs.

| Function | Description |
|-----|-----|-----|
| [ExecuteString](ExecuteString.md) | |
| [GetLuaState](GetLuaState.md) |  |
| [RunScript](RunScript.md) | |
| [PollDebugger](PollDebugger.md) | |

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

## Exposing C++ classes to Lua

Ultra Engine uses the [sol2](https://github.com/ThePhD/sol2) library to expose C++ classes and functions to Lua. It's most convenient to add a static function to each class you want to expose to Lua, called BindClass:
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

You can specify multiple versions of a functon or method using the sol::overload function, and sol::resolve to specify each function protocol:
```c++
L->new_usertype<Monster>
(
  "Monster",
  "Attack", sol::overload(
    sol::resolve<void(shared_ptr<Player>)>(&Attack),
    sol::resolve<void(shared_ptr<NPC>)>(&Attack)
  )
);
```

Alternatively, you can use a Lambda function to specify function overloads:

```c++
L->new_usertype<Monster>
(
  "MonsterClass",
  "Attack", sol::overload(
    [](Monster& m, shared_ptr<Player> p) { m.Attack(p); },
    [](Monster& m, shared_ptr<NPC> n) { m.Attack(n); }
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

Shared pointer function parameters that are allowed to have a value of NULL must be implemented using a raw pointer. The [Object::As](Object_As.md) method can be used to retrieve the object's shared pointer.

```cpp
L->set_function("CreateMonster",
    [](World* w) { if (w == NULL) return CreateMonster(NULL); return CreateMonster(w->As<World>()); }
);
```

**Do not** call make_shared() to create a new shared pointer, as this will result in the premature deletion of the object.

If NULL is not considered a valid value for the parameter, you can skip this and just use the shared pointer in your function definition.

### String Values

Lua does not recognize the Ultra Engine [String](String.md) and [WString](WString.md) classes, and these must be converted to std::string.

### Class Hierarchy

Define in header:
```c++
SOL_BASE_CLASSES(Monster, UltraEngine::Object);
```

### Casting Types

It's best to make a cast function for each class:
```c++
L->set_function("Monster", [](Monster* m) { if (m == NULL) return NULL; return m->As<Monster>(); ) } );
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
    "health", sol::property([](Monster& m, int h){ m.SetHealth(h)}, [](Monster& m){ return m.GetHealth()}, )
  );
  L->set_function("CreateMonster", &CreateMonster);
}
```

### Debugging User-defined Classes

You can add additional user-defined debugging information by adding a method called debug to your class and exposiing it:

```c+++
sol::table Monster::debug(sol::this_state ts) const
{
    auto t = Object::debug(ts);
    t["health"] = health;
    return t;
}
```
