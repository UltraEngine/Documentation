# RuntimeError #
This function generates a critical error and exits the program.

## Syntax ##
- **RuntimeError**(message: [WString](WString.md))

| Parameter | Description |
| --- | --- |
| message | error message to print |

## Example
```lua
function main(argc, argv)
    try
    {
        RuntimeError("Something went wrong!")
    }
    catch (e)
    {
        error = e
        DebugBreak()
    }
    return 0
end
```