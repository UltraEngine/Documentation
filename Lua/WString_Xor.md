# WString:Xor

This method encrypts the wide string with an XOR cipher and returns the result.

## Syntax

``` lua
function WString:Xor(key)
```

### Parameters

- `key`: The encryption key.

### Returns

Returns the encrypted string.

## Example

``` lua
local password = WString("HaikuMockingBonanzaTumble")
local key = WString("d'U0)Ez[^?2?=^X|y49dKurq9mASp`5}")
local encrypted = password:Xor(key)

print("Encrypted string: " .. encrypted:GetString())

local decrypted = encrypted:Xor(key)
print("Decrypted string: " .. decrypted:GetString())

```