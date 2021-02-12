# Timing #
Leadwerks 5 uses a fixed time step which makes timing in your application very easy. You do not have to account for the application framerate, even if the framerate is different from the frequency of the main thread.

In addition to the functions below, the [World](World.md) class includes some methods for per-world timing.

## Functions ##

| Name | Description |
|-----|-----|
| [Millisecs](Millisecs.md) | Retrieves the current CPU time. |
| [Sleep](Sleep.md) | Pauses the calling thread for a specified period of time. |