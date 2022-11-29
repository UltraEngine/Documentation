# Scene::Save

This method saves a scene to a file or stream.

## Syntax

- bool **Save**(const [WString](WString.md)& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(shared_ptr<[Stream](Stream.md)> stream, shared_ptr<[Stream](Stream.md)> binstream, const SaveFlags flags = SAVE_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to save to |
| stream | stream to write JSON data to |
| binstream | stream to write binary data to |
| flags | Save mode flags |

## Returns

If the scene is successfully saved true is returned, otherwise false is returned.
