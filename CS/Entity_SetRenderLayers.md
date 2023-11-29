# Entity.SetRenderLayers

This method is used to control which cameras an entity is visible in.

## Syntax

```csharp
public void SetRenderLayers(uint renderlayers)
```

| Parameter | Description |
|---|---|
| renderlayers | bitwise flag indicating which render layers the entity should appear in |

## Remarks

The default render layers value is 1.

## Example

```csharp
Entity entity = new Entity();
entity.SetRenderLayers(5);
```