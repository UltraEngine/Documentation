# String:__Xor__

This method encrypts the string with an XOR cipher and returns the result.

## Syntax

- [String](String.md) **:_Xor**(const [String](String.md)& key)

| Parameter | Description |
| --- | --- |
| key | encryption key |

## Returns

Returns the encrypted string.

## Example

```lua
-- Import the required libraries
local String = require("String")

local password = "HaikuMockingBonanzaTumble"
local key = "d'U0)Ez[^?2?=^X|y49dKurq9mASp`5}"
local encrypted = String:_Xor(key)

print("Encrypted string: " .. encrypted)

local decrypted = encrypted:_Xor(key)
print("Decrypted string: " .. decrypted)
```