# Probe

Base class: [Entity](Entity.md)

Environment probes add a volume in which indirect lighting is shown.

### Property

- `SetFadeDistance` (Method): Sets the edge fade distance.

### Function

- `CreateProbe` (Function): Creates a new probe entity.

```lua
-- Create a new probe entity
local probe = CreateProbe()
```

Note: The `CreateProbe` function will return a new probe entity. You can then use the `SetFadeDistance` method to set the edge fade distance for the probe.