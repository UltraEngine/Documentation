### Asset.GetPackage

This method gets the package an asset was loaded from.

#### Syntax

```csharp
Asset GetPackage()
```

#### Returns

If the asset was loaded from a package that has not been deleted, it will be returned. Otherwise, `null` is returned.

### Example

```csharp
Asset asset = new Asset();
Asset package = asset.GetPackage();
if (package != null)
{
    Console.WriteLine("Asset was loaded from package: " + package.ToString());
}
else
{
    Console.WriteLine("Asset was not loaded from any package.");
}
```