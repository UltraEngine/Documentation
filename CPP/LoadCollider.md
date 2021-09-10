# LoadCollider

This function loads a collider from a JSON file.

## Syntax

- shared_ptr<[Collider](Collider.md)> **LoadCollider**(const [WString](WString.md)& path, const [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file name to load |
| flags | optional load flags |

## Returns

Returns the loaded collider is successful, otherwise NULL is returned.
