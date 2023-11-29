# Material.GetTransparent

This method retrieves the material transparency mode.

## Syntax

```csharp
bool GetTransparent();
```

## Returns

Returns true if the material is using transparency, otherwise false is returned.

## Example

```csharp
if (material.GetTransparent())
{
    Console.WriteLine("Material is transparent");
}
else
{
    Console.WriteLine("Material is not transparent");
}
```