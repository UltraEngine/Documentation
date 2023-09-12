# Stream:Align

**function Align(bytes: number): boolean**

This function resizes the stream to be a multiple of the specified number of bytes and moves the stream position to the end.

## Parameters

- bytes: The number of bytes to align the stream to.

## Returns

Returns `true` if the stream was successfully aligned to the byte size, otherwise `false` is returned.

If the stream is read-only, then `false` will be returned.