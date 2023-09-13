# LoadPostEffect

This function loads a post-processing effect from a file.

## Syntax

- shared_ptr<[PostEffect](PostEffect.md)> **LoadPostEffect**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file name to load |
| flags | optional load flags |

## Returns

Returns the loaded post-processing effect is successful, otherwise NULL is returned.
