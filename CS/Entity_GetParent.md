# Entity.GetParent

This method retrieves an entity's parent.

## Syntax

```csharp
public Entity GetParent()
```

## Returns

Returns the parent entity if it exists, otherwise null is returned.

## Example

```csharp
Entity parentEntity = GetParent();
if(parentEntity == null)
{
    Console.WriteLine("No parent entity found.");
}
else
{
    Console.WriteLine("Parent entity found.");
}
```