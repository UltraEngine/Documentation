# Scene::Reload

This method reloads the states of the entities in a scene from a file, without recreating them. This is useful for loading game save states or synchonizing the world over a network.

## Syntax

- bool **Reload**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- bool **Reload**(shared_ptr<[Stream](Stream.md)\> stream, shared_ptr<[Stream](Stream.md)\> binstream, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to read |
| stream | JSON data to read |
| binstream | binary data to read |
| flags | optional load flags |

## Returns

Returns true of the scene was successfully reloaded, otherwise false is returned.
