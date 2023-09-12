# Entity:SetRenderLayers

This method is used to control which cameras an entity is visible in.

## Syntax

```lua
Entity:SetRenderLayers(renderlayers)
```

## Parameters

- **renderlayers**: bitwise flag indicating which render layers the entity should appear in

## Remarks

The default render layers value is 1.

## Example

```lua
-- Create a new entity
local entity = Entity()

-- Set the render layers for the entity
entity:SetRenderLayers(5)
```
This will set the render layers for the entity to include the second and third render layers.