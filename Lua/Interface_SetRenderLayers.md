### Interface:SetRenderLayers

This method can be used to control which cameras an interface is visible in.

#### Syntax

```lua
Interface:SetRenderLayers(renderlayers)
```

##### Parameters

| Parameter | Description |
|---|---|
| `renderlayers` | A bitwise flag indicating which render layers the entity should appear in. |

#### Example

```lua
local interface = Interface()
interface:SetRenderLayers(3)
```

In this example, the `SetRenderLayers` method is called on an `Interface` object, setting the render layers to `3`.