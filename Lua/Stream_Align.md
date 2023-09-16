# Stream:Align

This method resizes the stream to be a multiple of the specified number of bytes, and moves the stream position to the end.

## Syntax

- boolean **Align**(number bytes)

| Parameter | Description |
|---|---|
| bytes | byte alignment |

## Returns

Returns true if the stream was successfully aligned to the byte size, otherwise false is returned.

If the stream is read-only then false will be returned.
