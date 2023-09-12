# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ code.

Ultra Engine uses Lua 5.4 to give you access to [the very latest Lua features](https://www.lua.org/manual/5.4/readme.html#changes).

| Function | Description |
|-----|-----|
| [CallFunction](CallFunction.md) | executes a function call |
| [CallMethod](CallMethod.md) | executes a method-style function call |
| [ExecuteString](ExecuteString.md) | executes script code |
| [GetGlobal](GetGlobal.md) | retrieves a global variable |
| [GetLuaState](GetLuaState.md) | retrieves the game engine's Lua state |
| [PollDebugger](PollDebugger.md) | syncs information with the debugger |
| [RunScript](RunScript.md) | executes a script file |
| [SetGlobal](SetGlobal.md) | sets a global variable |

## Lua Interpreter for Lua

Below is complete Lua code for a program controlled primarily with Lua. The program first executes some required scripts in the "System" directory, then all scripts in the "Start" directory, and then runs the "Main.lua" file and exits when the script is finished:

```lua
-- Get commandline settings
local settings = ParseCommandLine(arg)

-- Run the error handler script
RunScript("Scripts/System/ErrorHandler.lua")

-- Enable the debugger if needed
local debugtimer
if type(settings["debug"]) == "boolean" and settings["debug"] == true then
    RunScript("Scripts/System/Debugger.lua")
    debugtimer = CreateTimer(510)
    ListenEvent(EVENT_TIMERTICK, debugtimer, function() PollDebugger(500) end)
end

-- Enable the entity component system
RunScript("Scripts/System/ComponentSystem.lua")

-- Run user start scripts
ExecuteDir("Scripts/Start")

-- Run main script
RunScript("Scripts/Main.lua")
```

## Debugging Lua Scripts

You can use [Visual Studio Code](https://code.visualstudio.com) with the [Lua Debugger](https://marketplace.visualstudio.com/items?itemName=devCAT.lua-debug) extension to debug Lua scripts in your game. The project template includes launch settings that will appear when you open the project template in Visual Studio Code. When you select the debug launch option, the -debug command line switch will be passed to your game's executable. 

Your game needs to interpret the command line switch and activate the debugger when the -debug option is specified. To do this, the debugger script must be run so the program can communicate with the IDE:
```lua
-- Get command-line options
local cl = ParseCommandLine(arg)

-- Enable script debugging if the -debug switch is specified
if type(cl["debug"]) == "boolean" and cl["debug"] == true then
    RunScript("Scripts/Modules/Debugger.lua")
end
```
Additionally, your program must periodically call the function [PollDebugger](PollDebugger.md) to receive updates from the IDE. This can be done with a timer in Lua:
```lua
-- Create a timer
local timer = CreateTimer(510)

-- Sync with the debugger every 500 milliseconds or so
ListenEvent(EVENT_TIMERTICK, timer, function() PollDebugger(500) end)
```
Alternatively, you can call the PollDebugger function in your main loop in Lua itself:
```lua
-- Main loop
while not window:KeyDown(KEY_ESCAPE) do
    PollDebugger()
    world:Update()
    world:Render(framebuffer)
end
```

Although by default the project is set to debug scripts using the debug build of your game, it is also possible to run the Lua debugger in release mode.

## User-defined Lua Classes in Lua

Ultra Engine uses the [sol](https://github.com/ThePhD/sol2) library to expose Lua classes and functions to Lua. It's most convenient to add a static function to each class you want to expose to Lua, called BindClass:

```lua
local Monster = {}
Monster.__index = Monster

setmetatable(Monster, {
    __call = function(cls, ...)
        return cls.new(...)
    end,
})

function Monster.new()
    local self = setmetatable({}, Monster)
    self.health = 0
    return self
end

function Monster.Update(self)
    -- Update function implementation
end

function Monster.BindClass(L)
    L:new_usertype(Monster, "MonsterClass",
        sol.property("health", sol.member(Monster.health)),
        sol.function("Update", Monster.Update)
    )
    L["CreateMonster"] = CreateMonster
end

function CreateMonster(world, health)
    -- CreateMonster function implementation
end
```

At the beginning of your program you can bind the class by calling the function:

```lua
local L = GetLuaState()
Monster.BindClass(L)
```

### Function Overloading

You can specify multiple versions of a functon or method using the sol.overload function. Let's say our class has two versions of a method:

```lua
function Monster:Attack(player)
    -- Method implementation
end

function Monster:Attack(villager)
    -- Method implementation
end
```

You can use sol.resolve to specify each function protocol:

```lua
L:new_usertype(Monster, "MonsterClass",
    sol.function("Attack", sol.overload(Monster.Attack, sol.types["shared_ptr<Player>"])),
    sol.function("Attack", sol.overload(Monster.Attack, sol.types["shared_ptr<Villager>"]))
)
```

Alternatively, you can use a Lua function to create function overloads:

```lua
L:new_usertype(Monster, "MonsterClass",
    sol.function("Attack", sol.lambda_function(Monster.Attack, sol.types["shared_ptr<Player>"])),
    sol.function("Attack", sol.lambda_function(Monster.Attack, sol.types["shared_ptr<Villager>"]))
)
```

### Default Parameters

Default parameters are not supported directly, but can be implemented using function overloading as follows: 

```lua
L["CreateMonster"] = sol.overload(
    function(world) return CreateMonster(world) end,
    function(world, health) return CreateMonster(world, health) end
)
```

### Shared Pointers

For the most part, shared pointers will work seamlessly with sol. However, the Lua nil value cannot be mapped to a shared pointer. If