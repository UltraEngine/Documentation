# CreateCamera

This function creates a new camera entity.

## Syntax 

shared_ptr<[Camera](Camera.md)\> **CreateCamera**(shared_ptr<[World](World.md)\> world, const [CameraProjectionMode](Constants.md#CameraProjectionMode) projectionmode)

| Parameter | Description |
|---|---|
| world | |
| projecitonmode | |

## Remarks

If orthographic projection is used, the new camera will have a depth range of (-1,1). With the default zoom (1.0) one pixel onscreen will be equal to one meter in space.

If perspective projection is used, the new camera will have a near depth range of 0.1 (ten centimeters) and a far depth range of 1000 (one kilometer).

**Ultra 2D Kit** does not support the perspective projection mode.

## Example
