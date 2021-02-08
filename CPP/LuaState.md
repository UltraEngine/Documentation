# LuaState #
This function returns the Lua state the engine scripting system is currently using.

## Syntax ##
- sol::state* **LuaState**()

## Returns ##
Returns a [Sol2](https://sol2.readthedocs.io) state object. You can get the raw Lua state by calling the lua_state() method on the returned object.
