# CasedPath

This function returns a file path with capitalization fixed to match the existing file on the hard drive. It will also convert backslashes to forward slashes. The specified file must exist.

## Syntax
`WString CasedPath(const WString& path)`

- `path` : file path to correct

## Returns
Returns the file path with corrected capitalization.

## Example

```lua
function main()
    local path = CurrentDir()

    -- Convert to lowercase
    path = path:Lower()
    Print("Lowercase path: ")
    Print(path)
    Print("")

    -- Correct case
    path = CasedPath(path)
    Print("Corrected path: ")
    Print(path)
end

main()
```