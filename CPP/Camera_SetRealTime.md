# Camera::SetRealTime

This method allows you to control whether a camera renders continously or only when prompted to.

## Syntax

- void **SetRealTime**(const bool mode)

| Parameter | Description |
|---|---|
| realtime | if set to true the camera will render continuously, otherwise it will render only when [Camera::Render](Camera_Render.md) is called |

## Remarks

You may want some cameras to only render once in a while, or when something changes. For example, a security camera that shows an image on a monitor in-game only needs to refreshed when the monitor is visible.
