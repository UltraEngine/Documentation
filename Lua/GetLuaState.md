# GetLuaState

This function returns the sol Lua state, for low-level usage.

## Syntax

```lua
function GetLuaState() --> sol.state
```

## Returns

Returns the game engine's sol lua state.

## Remarks

This is an advanced feature. See the Lua and sol documentation for more information:
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)
- [sol Documentation](https://sol2.readthedocs.io/en/latest/)

## Example

```lua
MyValue = 3
value = GetLuaState():get("MyValue")
Print(value)

L = GetLuaState():lua_state()
lua_pushstring(L, "Fred")
lua_setglobal(L, "name")
lua_getglobal(L, "name")
if lua_isstring(L, -1) then
    s = lua_tostring(L, -1)
    Print(s)
else
    Print("Value is not a string.")
end
```