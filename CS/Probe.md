# Probe

Base class: [Entity](Entity.md)

Environment probes add a volume in which indirect lighting is shown.

| Property | Type | Description |
|---|---|---|
| [SetFadeDistance](Probe_SetFadeDistance.md) | Method | sets the edge fade distance |
| [CreateProbe](CreateProbe.md) | Function | creates a new probe entity |

## Syntax in C#

```csharp
public class Probe : Entity
{
    public void SetFadeDistance(float fadeDistance)
    {
        // sets the edge fade distance
    }

    public static Probe CreateProbe()
    {
        // creates a new probe entity
    }
}
```