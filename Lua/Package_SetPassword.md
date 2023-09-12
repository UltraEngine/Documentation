### Package:SetPassword

This method sets a password for the package.

#### Syntax

```lua
function Package:SetPassword(password)
```

#### Parameters

| Parameter | Description |
|---|---|
| password | password string to set |

#### Remarks

Ultra Engine does not support Zip archives saved with the Advanced Encryption Standard (AES). Encrypted Zip archives should use legacy encryption.