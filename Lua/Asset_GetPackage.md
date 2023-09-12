# Asset:GetPackage

This function gets the package from which an asset was loaded.

## Syntax

```lua
function Asset:GetPackage() -> Asset
```

## Returns

If the asset was loaded from a package that has not been deleted, it will be returned. Otherwise, `nil` is returned.