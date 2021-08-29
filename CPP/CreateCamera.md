# CreateCamera

This function creates a new camera entity.

## Syntax 

shared_ptr<[Camera](Camera.md)\> **CreateCamera**(shared_ptr<[World](World.md)\> world, const [CameraProjectionMode](Constants.md#CameraProjectionMode) projectionmode)

| Parameter | Description |
|---|---|
| world | |
| projecitonmode | |

## Remarks

You can create multiple cameras to render with. Cameras will be rendered in the order they are created. In most cases you will want to call [Camera::SetClearMode](Camera_SetClearMode.md) with CLEAR_DEPTH as the argument, for all cameras created after the first one. This will ensure that the results of the previous camera render remain visible on the screen.

If orthographic projection is used, the new camera will have a depth range of (-1,1). With the default zoom (1.0) one pixel onscreen will be equal to one meter in space.

If perspective projection is used, the new camera will have a near depth range of 0.1 (ten centimeters) and a far depth range of 1000 (one kilometer).

**Ultra 2D Kit** does not support the perspective projection mode.

## Example
