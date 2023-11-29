## Syntax

- int **Command**(string command, Stream stream = null)

| Parameter | Description |
|---|---|
| command | command to send |
| stream | stream to capture any printed output |

## Returns

Returns the command result.

## Remarks

On the Windows operating system the command output will be piped to a file stored in the system "ProgramData/Ultra Engine" directory. This file should be deleted if the command output contains any sensitive information.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Stream stream = CreateBufferStream();
#ifdef _WIN32
        Command("systeminfo | findstr /B /C:\"OS Name\"", stream);
#else
        Command("uname -r", stream);
#endif
        while (!stream.Eof())
        {
            Print(stream.ReadLine());
        }
    }
}
```