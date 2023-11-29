# Collider.Save

This method saves the collider to a file.

## Syntax

```csharp
bool Save(string path, SaveFlags flags = SaveFlags.SAVE_DEFAULT)
```

Parameter | Description
-|-
`path` | file path to save to
`flags` | optional save flags

## Returns

Returns `true` if the collider is saved, otherwise `false` is returned.

## Example

```csharp
string filePath = "path/to/save/collider";
bool isSaved = collider.Save(filePath, SaveFlags.SAVE_DEFAULT);
if (isSaved)
{
    Console.WriteLine("Collider saved successfully.");
}
else
{
    Console.WriteLine("Failed to save collider.");
}
```