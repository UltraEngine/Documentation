# Scripting

Ultra Engine supports scripts written with the [Lua](https://www.lua.org) programming language.
Scripts can be attached to entities or used to control the entire program.
You can even combine Lua scripts with C++ code.

Ultra Engine uses Lua 5.4 to give you access to [the very latest Lua features](https://www.lua.org/manual/5.4/readme.html#changes).

| Function | Description |
|-----|-----|
| [CallFunction](CallFunction.md) | executes a function call |
| [ExecuteString](ExecuteString.md) | executes script code |
| [GetGlobal](GetGlobal.md) | retrieves a global variable |
| [GetLuaState](GetLuaState.md) | retrieves the game engine's Lua state |
| [PollDebugger](PollDebugger.md) | syncs information with the debugger |
| [RunScript](RunScript.md) | executes a script file |
| [SetGlobal](SetGlobal.md) | sets a global variable |

## C# Interpreter for Lua

Below is complete C# code for a program controlled primarily with Lua. The program first executes some required scripts in the "System" directory, then all scripts in the "Start" directory, and then runs the "Main.lua" file and exits when the script is finished:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;
using static UltraEngine.lua;

namespace UltraEngine_CSharp
{
    class Program
    {
        static void ExecuteDir(WString path)
        {
            var dir = LoadDir(path);
            foreach (var file in dir)
            {
                WString filepath = path + "/" + file;
                switch (FileType(filepath))
                {
                    case 1:
                        if (ExtractExt(file).Lower() == "lua") RunScript(filepath);
                        break;
                    case 2:
                        ExecuteDir(filepath);
                        break;
                }
            }
        }

        static int Main(string[] args)
        {
            //Get commandline settings
            var settings = ParseCommandLine(args);

            //Run the error handler script
            RunScript("Scripts/System/ErrorHandler.lua");

            //Enable the debugger if needed
            Timer debugtimer = null;
            if (settings["debug"].is_boolean() && settings["debug"] == true)
            {
                RunScript("Scripts/System/Debugger.lua");
                debugtimer = CreateTimer(510);
                ListenEvent(EVENT_TIMERTICK, debugtimer, () => PollDebugger(500));
            }

            //Enable the entity component system
            RunScript("Scripts/System/ComponentSystem.lua");

            //Run user start scripts
            ExecuteDir("Scripts/Start");

            //Run main script
            RunScript("Scripts/Main.lua");

            return 0;
        }
    }
}
```

## Debugging Lua Scripts

You can use [Visual Studio Code](https://code.visualstudio.com) with the [Lua Debugger](https://marketplace.visualstudio.com/items?itemName=devCAT.lua-debug) extension to debug Lua scripts in your game. The project template includes launch settings that will appear when you open the project template in Visual Studio Code. When you select the debug launch option, the -debug command line switch will be passed to your game's executable.

Your game needs to interpret the command line switch and activate the debugger when the -debug option is specified. To do this, the debugger script must be run so the program can communicate with the IDE:
```csharp
static int Main(string[] args)
{
    //Get command-line options
    var cl = ParseCommandLine(args);

    //Enable script debugging if the -debug switch is specified
    if (cl["debug"].is_boolean() && cl["debug"] == true)
    {
        RunScript("Scripts/Modules/Debugger.lua");
    }
```
Additionally, your program must periodically call the function `PollDebugger` to receive updates from the IDE. This can be done with a timer in C#:
```csharp
//Create a timer
var timer = CreateTimer(510);

//Sync with the debugger every 500 milliseconds or so
ListenEvent(EVENT_TIMERTICK, timer, () => PollDebugger(500));
```
Alternatively, you can call the `PollDebugger` function in your main loop in Lua itself:
```lua
--Main loop
while window:KeyDown(KEY_ESCAPE) == false do
    PollDebugger()
    world:Update()
    world:Render(framebuffer)
end
```

Although by default the project is set to debug scripts using the debug build of your game, it is also possible to run the Lua debugger in release mode.

## User-defined C# Classes in Lua

Ultra Engine uses the [sol](https://github.com/ThePhD/sol2) library to expose C++ classes and functions to Lua. It's most convenient to add a static function to each class you want to expose to Lua, called BindClass:

```csharp
class Monster : Object
{
    int health;
    void Update();
    static void BindClass(state L);
}

shared_ptr<Monster> CreateMonster(shared_ptr<World> world, int health = 100);
```

The `Monster:BindClass` function definition would look like this:

```csharp
static void Monster.BindClass(state L)
{
    L.new_usertype<Monster>(
        "MonsterClass",
        "health", ref health,
        "Update", &Update
    );
    L.set_function("CreateMonster", &CreateMonster);
}
```

At the beginning of your program you can bind the class by calling the function:

```csharp
var L = GetLuaState();
Monster.BindClass(L);
```

### Function Overloading

You can specify multiple versions of a function or method using the `sol.overload` function. Let's say our class has two versions of a method:

```csharp
virtual void Attack(shared_ptr<Player> player);
virtual void Attack(shared_ptr<Villager> villager);
```

You can use `sol.resolve` to specify each function protocol:

```csharp
L.new_usertype<Monster>(
  "MonsterClass",
  "Attack", sol.overload(
    sol.resolve<void(shared_ptr<Player>)>(&Attack),
    sol.resolve<void(shared_ptr<Villager>)>(&Attack)
  )
);
```

Alternatively, you can use a Lambda function to create function overloads:

```csharp
L.new_usertype<Monster>(
  "MonsterClass",
  "Attack", sol.overload(
    (Monster m, shared_ptr<Player> p) => m.Attack(p),
    (Monster