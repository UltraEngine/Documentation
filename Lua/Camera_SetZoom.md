# Camera:SetZoom

This method sets the camera zoom factor.

## Syntax

```lua
function Camera:SetZoom(zoom: number)
```

## Parameters

| Parameter | Description |
| --- | --- |
| zoom | camera zoom factor |

## Remarks

The default camera zoom is 1.0.

## Example

```lua
-- Create a camera object
local camera = Camera()

-- Set the zoom factor to 2.5
camera:SetZoom(2.5)
```