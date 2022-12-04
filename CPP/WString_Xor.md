# WString::Xor

This method encrypts the string with an XOR cipher and returns the result.

## Syntax

- [WString](WString.md) **Xor**(const [WString](WString.md)& key)

| Parameter | Description |
| --- | --- |
| key | encryption key |

## Returns

Returns the encrypted string.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString password = "HaikuMockingBonanzaTumble";
    WString key = "d'U0)Ez[^?2?=^X|y49dKurq9mASp`5}";
    WString encrypted = password.XOR(key);

    Print("Encrypted string: " + encrypted);

    WString decrypted = encrypted.Xor(key);
    Print("Decrypted string: " + decrypted);

    return 0;
}
```
