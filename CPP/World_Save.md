# World::Save

This method serializes the world to a file that can be loaded later. This can be used for saving the current game state, or for saving a scene.

## Syntax

- bool **Save**(const [WString](WString.md)& path, const LoadFlags flags)

| Parameter | Description |
|---|---|
|||

## Remarks

The save routine works with the entity component system to save your own C++ classes.
