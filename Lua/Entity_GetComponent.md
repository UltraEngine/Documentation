# Entity:GetComponent

## Syntax

<pre><code>function GetComponent<T>()
</code></pre>

## Parameters

| Parameter | Description |
|---|---|
| T | The class type of the component. |

## Returns

Returns a component if it exists, otherwise `nil` is returned.

#### Example

```lua
local positionComponent = GetComponent<PositionComponent>()
if positionComponent ~= nil then
  -- Do something with the position component
else
  -- The component doesn't exist
end
```