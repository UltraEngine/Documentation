# RunScript

This function executes a Lua script from a file or string.

## Syntax

boolean **RunScript**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

## Parameters

| Parameter | Description |
|-----|-----|
| path | script file to run |

## Returns

Returns true if the script was successfully run, otherwise false is returned.

## Remarks

This command can run both raw Lua code files (.lua) or compiled Lua byte code (.luac). See the [Lua documentation](https://www.lua.org/manual/5.4/luac.html) for additional information.

A build of the luac compiler is included in the "Tools" folder of the Ultra Engine install directory.
