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

You can control which entities are visible to a camera with the [Entity::SetRenderLayer](Entity_SetRenderLayer.md) method.

There are no 2D objects or drawing commands in Ultra Engine. Instead, all rendering is done through a uniform pipeline and the camera projection mode is used to control whether objects appear in 3D or 2D space. If you want to render 2D objects on top of a 3D scene, as you would for a head-up display in a game, you can create an extra camera to render in 2D in top of the perspective camera.

If orthographic projection is used, the new camera will have a depth range of (-1,1). With the default zoom (1.0) one pixel onscreen will be equal to one meter in space.

If perspective projection is used, the new camera will have a near depth range of 0.1 (ten centimeters) and a far depth range of 1000 (one kilometer).

## Example
