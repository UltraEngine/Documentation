# CreatePackage

This function creates a new package.

## Syntax

- [Package](Package.md) **CreatePackage**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

## Returns

Returns a new package if successful, otherwise NULL is returned.

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
