## Syntax

```csharp
LightFalloffMode GetFalloff();
```

## Returns

Returns `LightFalloff.LINEAR` or `LightFalloff.INVERSE_SQUARE`.

## Example

```csharp
LightFalloffMode falloff = light.GetFalloff();
if (falloff == LightFalloff.LINEAR)
{
    Debug.Log("Light falloff is linear.");
}
else if (falloff == LightFalloff.INVERSE_SQUARE)
{
    Debug.Log("Light falloff is inverse square.");
}
```