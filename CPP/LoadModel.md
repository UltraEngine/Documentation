# LoadModel

This function loads a model from a file.

## Syntax

- shared_ptr<[Model](Model.md)\> **LoadModel**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Model](Model.md)\> **LoadModel**(shared_ptr<[Stream](Stream.md)\> stream, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to read from |
| stream | stream to read from |

## Returns

Returns the loaded model if successful, otherwise NULL is returned.
