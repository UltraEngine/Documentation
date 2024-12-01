# Assert

This function produces a runtime error if the supplied condition or object is false or nil.

## Syntax

- **Assert**(boolean condition, [string](https://www.lua.org/manual/5.4/manual.html#6.4) message)
- **Assert**([Object](Object.md) o, [string](https://www.lua.org/manual/5.4/manual.html#6.4) message)

## Parameter
| Parameter | Description |
|---|---|
| condition | if false a runtime error is generated |
| o | if nil a runtime error is generated |
| message | error message to display |

## Example

```lua
Assert(false, "An error occurred.")
```
