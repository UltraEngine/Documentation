# Assert
This function produces a runtime error if the supplied condition or object is false or nil.

## Syntax

- **Assert**([condition](#condition))
- **Assert**([condition](#condition), [message](#message))
- **Assert**([o](#o))
- **Assert**([o](#o), [message](#message))

## Parameter
| Parameter | Description |
|---|---|
| condition | if false a runtime error is generated |
| o | if nil a runtime error is generated |
| message | error message to display |

## Example
```lua
function main()
    pcall(Assert, false)
end

main()
```