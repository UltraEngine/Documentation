# String.Xor

This method encrypts the string with an XOR cipher and returns the result.

## Syntax

- [string](https://docs.microsoft.com/en-us/dotnet/api/system.string) **Xor**(const [string](https://docs.microsoft.com/en-us/dotnet/api/system.string)& key)

| Parameter | Description |
| --- | --- |
| key | encryption key |

## Returns

Returns the encrypted string.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string password = "HaikuMockingBonanzaTumble";
        string key = "d'U0)Ez[^?2?=^X|y49dKurq9mASp`5}";
        string encrypted = Xor(password, key);

        Console.WriteLine("Encrypted string: " + encrypted);

        string decrypted = Xor(encrypted, key);
        Console.WriteLine("Decrypted string: " + decrypted);
    }

    static string Xor(string input, string key)
    {
        char[] inputChars = input.ToCharArray();
        char[] keyChars = key.ToCharArray();
        char[] result = new char[inputChars.Length];

        for (int i = 0; i < inputChars.Length; i++)
        {
            result[i] = (char)(inputChars[i] ^ keyChars[i % keyChars.Length]);
        }

        return new string(result);
    }
}
```