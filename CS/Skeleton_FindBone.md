## Syntax

```csharp
Bone FindBone(string name, bool cased = false)
```

## Parameters

| Parameter | Description |
|---|---|
| name | The bone name to search for. |
| cased | If set to true, the search will be case-sensitive. |

## Returns

A `Bone` object with the specified name if found, otherwise `null` is returned.

---

Example:

```csharp
Bone bone = Skeleton.FindBone("head", true);
if (bone != null)
{
    // Bone found
}
else
{
    // Bone not found
}
```