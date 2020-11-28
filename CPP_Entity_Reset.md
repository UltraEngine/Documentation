# Entity::Reset #
This method resets an entity. Use this to disable rendering interpolation when an object is "teleported" to a new location.

## Syntax ##
- void **Reset**()

## Remarks ##
Rendering is performed on a separate thread, and is likely to run at a different frequency than the main thread. In the rendering thread, changes to an entity's position, rotation, scale, and color are smoothly inerpolated between the most recent two updates received, resulting in smooth motion. If for any reason you want motion and color forced to the current value when they are received, this command can be called after setting the orientation or color. For example, if you load a model and then place it in a position where it is supposed to appear, you may wish to call this command to ensure there is not any interpolation between its original and final positions.

Note that if physics are enabled it may introduce additional interpolation.
