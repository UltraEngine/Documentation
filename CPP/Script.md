# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ and C# programs.

## Properties

| Name | Type | Description |
|-----|-----|-----|
| [ExecuteString](ExecuteString.md) | Function | |
| [RunScript](RunScript.md) | Function | |
| [PollDebugger](PollDebugger.md) | Function | |
| [LuaState](LuaState.md) | Function | |

## Exposing C++ classes to Lua

Ultra Engine uses the [sol2](https://github.com/ThePhD/sol2) library to expose C++ classes and functions to Lua.

```c++
class Monster
{
public:
  int health;
  
  void Update();

  static void BindClass(sol::state* L)
  {
    L->new_usertype<Monster>
    (
      "Monster",
      "health", &health,
      "Update", &Update
    );
  }
};
```

At the beginning of your program you can bind your class by calling the function:

```c++
auto L = GetLuaState();
Monster::BindClass();
```

## Function Overloading

## Default Parameters

## NULL Values

## String Values
