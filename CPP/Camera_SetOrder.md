# Camera::SetOrder

This method sets the drawing order of a camera.

## Syntax

- void **SetOrder**(const int order)

| Parameter | Description |
|---|---|
| order | drawing index |

## Remarks

By default, cameras are drawn in the order they are created. You can use this method to override this order. All cameras are created with a draw order of zero. You can set a lower number to make a camera draw before others or a higher number to make the camera draw after others.
