# String

The String class provides an interface for manipulating ASCII text strings.

Base class: Object, std::string

| Property | Type | Description |
|---|---|---|
| String | Constructor | String(c: string) |
| String | Constructor | String(i: number) |
| String | Constructor | String(f: number) |
| String | Constructor | String(d: number) |
| [Find](String_Find.md) | Method | performs a search operation |
| [Left](String_Left.md) | Method | returns leftmost characters |
| [GetSize](String_GetSize.md) | Method | returns the length of the string |
| [Lower](String_Lower.md) | Method | converts the string to lowercase |
| [Mid](String_Mid.md) | Method | returns the length of the string |
| [Replace](String_Replace.md) | Method | performs a search and replace operation |
| [Right](String_Right.md) | Method | returns rightmost characters |
| [Split](String_Split.md) | Method | segments the string |
| [StartsWith](String_StartsWith.md) | Method | compares the beginning of two strings |
| [ToFloat](String_ToFloat.md) | Method | converts the string to a floating point value |
| [ToInt](String_ToInt.md) | Method | converts the string to an integer value |
| [Trim](String_Trim.md) | Method | removes whitespace characters from the ends of the string |
| [Upper](String_Upper.md) | Method | converts the string to uppercase |
| [Xor](String_Xor.md) | Method | performs an XOR operation |
| [Uuid](Uuid.md) | Function | creates a unique universal identifier |

## Example
```lua
-- Create a new String object with a string literal
local str1 = String("Hello, Lua!")

-- Create a new String object with an integer
local str2 = String(100)

-- Create a new String object with a floating point number
local str3 = String(3.14)

-- Perform a search operation on a string
local index = str1:Find("Lua")
print("Index:", index)

-- Get the leftmost characters of a string
local leftChars = str1:Left(5)
print("Left characters:", leftChars)

-- Get the length of a string
local size = str1:GetSize()
print("Size:", size)

-- Convert a string to lowercase
local lowerStr = str1:Lower()
print("Lowercase string:", lowerStr)

-- Perform a search and replace operation on a string
local replacedStr = str1:Replace("Lua", "World")
print("Replaced string:", replacedStr)

-- Get the rightmost characters of a string
local rightChars = str1:Right(5)
print("Right characters:", rightChars)

-- Segment a string
local segments = str1:Split(",")
print("Segments:", table.concat(segments, ", "))

-- Compare the beginning of two strings
local startsWith = str1:StartsWith("Hello")
print("Starts with 'Hello'?", startsWith)

-- Convert a string to a floating point value
local floatValue = str3:ToFloat()
print("Float value:", floatValue)

-- Convert a string to an integer value
local intValue = str2:ToInt()
print("Int value:", intValue)

-- Remove whitespace characters from the ends of a string
local trimmedStr = str1:Trim()
print("Trimmed string:", trimmedStr)

-- Convert a string to uppercase
local upperStr = str1:Upper()
print("Uppercase string:", upperStr)

-- Perform an XOR operation on two strings
local xorStr = str1:Xor("Hi")
print("XOR result:", xorStr)

-- Create a unique universal identifier
local uuid = Uuid()
print("UUID:", uuid)
```