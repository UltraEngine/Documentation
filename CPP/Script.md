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
  static void BindClass(sol::state* L);
};

extern shared_ptr<Monster> CreateMonster(shared_ptr<World> world, int health = 100);
```

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

At the beginning of your program you can bind your class by calling the function:

```c++
auto L = GetLuaState();
Monster::BindClass(L);
```

## Function Overloading

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

## Default Parameters

Default parameters are not supported directly, but can be implemented using function overloading as follows: 

```cpp
L->set_function("CreateMonster", sol::overload(
  [](shared_ptr<World> world){ return CreateMonster(world); },
  [](shared_ptr<World> world, int health){ return CreateMonster(world, health); }
));
```

## NULL Shared Pointers

Shared pointer function parameters that are allowed to have a value of NULL must be implemented using a raw pointer. The [Object::As](Object_As.md) method can be used to retrieve the object's shared pointer.

```cpp
L->set_function("CreateMonster",
    [](World* w) { if (w == NULL) return CreateMonster(NULL); return CreateMonster(w->As<World>()); }
);
```

**Do not** call make_shared() to create a new shared pointer, as this will result in the premature deletion of the object.

## String Values

## Class Hierarchy

## Casting Types

## Getters and Setters
