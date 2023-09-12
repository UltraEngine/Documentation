# Strings

Strings in Lua are handled using the built-in string data type. There are no specific classes for narrow and wide strings like in Ultra Engine. Lua supports Unicode characters, so there is no need to distinguish between narrow and wide strings.

## Constructors

Strings can be created using string literals:
```lua
local s = "Hello!"
```
There is no need to use a specific syntax for Unicode strings, as Lua handles them automatically.

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