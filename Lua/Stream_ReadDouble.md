# stream:ReadDouble #
This function reads a double float value from the stream.

## Syntax ##
- **stream:ReadDouble()**

## Returns ##
- Returns a double float value read from the stream.

## Example

```lua
function main(argc, argv)
    local path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

    -- Open a stream with read and write permissions
    DeleteFile(path)
    local stream = OpenFile(path)
    if stream == nil then
        Print("Failed to write file.")
        return 0
    end

    -- Write some data
    stream:WriteByte(1)
    stream:WriteDouble(2.0)
    stream:WriteFloat(3.0)
    stream:WriteInt(4)
    stream:WriteShort(5)

    -- Change the stream position
    stream:Seek(0)

    -- Read back the data
    Print(stream:ReadByte())
    Print(stream:ReadDouble())
    Print(stream:ReadFloat())
    Print(stream:ReadInt())
    Print(stream:ReadShort())

    -- Close the stream
    stream:Close()

    return 0
end
```