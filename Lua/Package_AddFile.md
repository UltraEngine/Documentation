# Package:AddFile

This function writes a new file to a package.

## Syntax

```lua
function Package:AddFile(path: string, data: Buffer, immediate: boolean): boolean
```

- `path` (string): relative file path.
- `data` (Buffer): file contents.
- `immediate` (boolean, optional): if set to true, the package file will be immediately saved. Default is false.

## Returns

Returns `true` if successful, otherwise `false` is returned.

If the package is closed, `false` will be returned.

If the package was loaded with a plugin that does not support writing, `false` will be returned.

## Example

```lua
-- Create a new zip package
local pak = CreatePackage("test.zip")

-- Create a stream
local stream = CreateBufferStream()

-- Write a line of text
stream:WriteLine("Hello!")

-- Insert the stream contents into the package
pak:AddFile("test.txt", stream.data)

-- Close the stream
stream:Close()

-- Close the package to finalize changes
pak:Close()

-- Open the zip file in the default program
RunFile("test.zip")
```