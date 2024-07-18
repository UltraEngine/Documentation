# Xor

This method encrypts the string with an XOR cipher and returns the result.

## Syntax

- string **Xor**(string key)

| Parameter | Description |
| --- | --- |
| key | encryption key |

## Returns

Returns the encrypted string.

## Example

```lua
local password = "HaikuMockingBonanzaTumble"
local key = "d'U0)Ez[^?2?=^X|y49dKurq9mASp`5}"
local encrypted = Xor(password, key)

Print("Encrypted string: " .. encrypted)

local decrypted = Xor(encrypted, key)
Print("Decrypted string: " .. decrypted)
```
