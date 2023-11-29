# Stream.Align

This method resizes the stream to be a multiple of the specified number of bytes, and moves the stream position to the end.

## Syntax

```csharp
bool Align(int bytes)
```

| Parameter | Description |
|---|---|
| bytes | byte alignment |

## Returns

Returns true if the stream was successfully aligned to the byte size, otherwise false is returned.

If the stream is read-only then false will be returned.

## Example

```csharp
// Assuming 'stream' is an instance of the Stream class

if(stream.Align(4))
{
    Console.WriteLine("Stream aligned successfully.");
}
else
{
    Console.WriteLine("Failed to align stream.");
}
```