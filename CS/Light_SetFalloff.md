- void **SetFalloff**(LightFalloffMode falloff)

| Parameter | Description |
|---|---|
| falloff | light falloff mode, can be [LIGHTFALLOFF_LINEAR](link) or [LIGHTFALLOFF_INVERSE_SQUARE](link) |


```csharp
public void SetFalloff(LightFalloffMode falloff)
{
    // code to set the light falloff mode
}
```

Example Usage:
```csharp
Light.SetFalloff(LightFalloffMode.LINEAR);
```