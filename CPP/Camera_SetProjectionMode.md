# Camera::SetProjectionMode

This method sets the projection method used by the camera.

## Syntax

- void **SetProjectionMode**(const CameraProjectionMode projectionmode)

| Parameter | Description |
|---|---|
| projectionmode | can be PROJECTION_PERSPECTIVE, PROJECTION_ORTHOGRAPHIC, or PROJECTION_NONE |

## Remarks

Perspective projection is used for 3D rendering. Orthograph projection can be used for 2D rendering. If the projection mode is set to PROJECTION_NONE the camera will not be rendered.
