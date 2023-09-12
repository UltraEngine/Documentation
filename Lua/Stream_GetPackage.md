# Stream:getPackage

**Stream:getPackage** is a method that returns the package from which the stream was loaded.

## Syntax

```lua
function Stream:getPackage()
```

## Returns

If the stream was loaded from a package that has not been deleted yet, it will be returned. Otherwise, `nil` will be returned.