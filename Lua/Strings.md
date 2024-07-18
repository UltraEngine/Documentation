# Strings

Strings in Lua are handled using the built-in string data type. There are no specific classes for narrow and wide strings like in the C++ API. Lua strings are considered to be in UTF-8 format and converted to and from wide strings when they are pass as function arguments or returned from an API function.

## Constructors

In Lua, strings can be created using string literals like so:
```lua
local s = "Hello!"
```

Common numeric data types can be converted to a string using the `tostring` function:
```lua
local s1 = tostring(2) -- integer to string conversion
local s2 = tostring(2.43434) -- float to string conversion
```

## String Conversion

Narrow to wide string conversion is not relevant in Lua, as there is no separate wide string type.

To convert a string to an integer or floating point value, Lua provides the `tonumber` function:
```lua
local n = tonumber("465")
local f = tonumber("3.14")
```
