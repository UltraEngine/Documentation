# GetHmd

This function returns the head-mounted display, for virtual reality rendering.

## Syntax

- [Hmd](Hmd.md) **GetHmd**(shared_ptr<[World](World.md)\> world)

| Parameter | Description |
|---|---|
| world | world to display the VR controllers in |

## Returns

Returns an object representing the user's head-mounted display. This will always be returned, regardless of whether the headset is plugged in or active.

## Remarks

This function must be called before the first call to [World:Render](World_Render.md).

The world parameter will be ignored after the first call to this function.
