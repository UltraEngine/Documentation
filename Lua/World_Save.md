# World:Save

This method serializes the world to a file that can be loaded later. This can be used for saving the current game state, saving a scene created with a custom editor, or relaying the current game state to a new player who joins a multiplayer game.

## Syntax

```lua
function World:Save(path: string, flags: SaveFlags = SAVE_DEFAULT): boolean
```

- `path`: file path to save.
- `flags`: optional save flags.

## Remarks

The save routine works with the [entity component system](EntityComponentSystem.md) to save your own Lua classes.