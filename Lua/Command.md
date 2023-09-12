# Command

This function allows you to interact with the operating system terminal or console. This can be used to perform low-level system actions.

## Syntax

```lua
function Command(command: string): string
```

- **command:** command to send

## Returns

Returns the printed output of the terminal or console.

## Remarks

On the Windows operating system the command output will be piped to a file stored in the system "ProgramData/Ultra Engine" directory. This file should be deleted if the command output contains any sensitive information.

## Example

```lua
Command("systeminfo | findstr /B /C:\"OS Name\"")
```