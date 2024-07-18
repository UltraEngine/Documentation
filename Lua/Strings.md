# Strings

Strings in Lua are handled using the built-in string data type. There are no specific classes for narrow and wide strings like in the C++ API. Lua strings are considered to be in UTF-8 format and converted to and from wide strings when they are pass as function arguments or returned from an API function.

## Constructors

In Lua, strings can be created using string literals like so:

```lua
local s = "Hello!"
```
Common numeric data types can be converted to a string using the **tostring** function:

```lua
local s1 = tostring(2) -- integer to string conversion
local s2 = tostring(2.43434) -- float to string conversion
```

## String Conversion

Narrow to wide string conversion is not relevant in Lua, as there is no separate wide string type.

To convert a string to an integer or floating point value, Lua provides the **tonumber** function:

```lua
local n = tonumber("465")
local f = tonumber("3.14")
```

## Functions

The following functions are available, in addition to the [Lua language string library](https://www.lua.org/pil/20.html).

| Property | Type | Description |
|---|---|---|
| [Find](String_Find.md) | Function | performs a search operation |
| [Left](String_Left.md) | Function | returns leftmost characters |
| [Len](String_Len.md) | Function | returns the length of the string |
| [Lower](String_Lower.md) | Function | returns the string to lowercase |
| [Mid](String_Mid.md) | Function | returns the length of the string |
| [Replace](String_Replace.md) | Function | performs a search and replace operation |
| [Right](String_Right.md) | Function | returns rightmost characters |
| [Split](String_Split.md) | Function | segments the string |
| [StartsWith](String_StartsWith.md) | Function | compares the beginning of two strings |
| [Trim](String_Trim.md) | Function | removes whitespace characters from the ends of the string |
| [Upper](String_Upper.md) | Function | converts the string to uppercase |
| [Xor](String_Xor.md) | Function | performs an XOR operation |
| [Uuid](Uuid.md) | Function | creates a unique universal identifier |
