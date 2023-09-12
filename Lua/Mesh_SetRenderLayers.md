# Mesh:SetRenderLayers

This method is used to control which cameras an entity is visible in.

## Syntax

```lua
function Mesh:SetRenderLayers(renderlayers)
```

## Parameters

| Parameter | Description |
|---|---|
| renderlayers | a bitwise flag indicating which render layers the mesh should appear in |

## Remarks

The default render layers value is 0xffffffff (all layers).