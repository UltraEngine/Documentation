# Asset::GetPackage

This method gets the package an asset was loaded from.

## Syntax

- shared_ptr<[Asset](Asset.md)\> **GetPackage**()

## Returns

If the asset was loaded from a package that has not been deleted it will be returned, otherwise NULL is returned.
