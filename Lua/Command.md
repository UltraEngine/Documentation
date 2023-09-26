# Command

This function allows you to interact with the operating system terminal or console. This can be used to perform low-level system actions.

## Syntax

- number **Command**([string](https://www.lua.org/manual/5.4/manual.html#6.4) command, [Stream](Stream.md) stream = nil)

Parameter | Description
---|---
command | command to execute
stream | optional stream for capturing printed output

## Returns

Returns the printed output of the terminal or console.

## Remarks

On the Windows operating system the command output will be piped to a file stored in the system "ProgramData/Ultra Engine" directory. This file should be deleted if the command output contains any sensitive information.

## Example

```lua
Command("systeminfo | findstr /B /C:\"OS Name\"")
```
