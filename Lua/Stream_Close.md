# Stream:Close #
This method manually closes the stream for further read and write operations.

## Syntax ##
- **Close**(): void

## Remarks ##
It is not necessary to call this method, as a stream will automatically close when it is deleted, but this method provides an additional mechanism to explicitly close it. This could be useful if you are not sure if the shared pointer is stored somewhere else in your program.

## Example

```lua
function main()
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
end

main()
```