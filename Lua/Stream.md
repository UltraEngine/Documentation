# Stream #

**Base class**: `Object`

This class provides an interface for reading and writing files.

| Property | Type | Description |
| ----- | ----- | ----- |
| path | const `WString`& | read-only file name or URL |
| package | const `WString`& | read-only file name or URL |
| [`Align`](Stream_Align.md) | Function | aligns the stream to a multiple of the specified size |
| [`Close`](Stream_Close.md) | Function | closes the stream |
| [`Eof`](Stream_Eof.md) | Function | returns true when the end of the stream is reached |
| [`Flush`](Stream_Flush.md) | Function | flushes the stream |
| [`GetPackage`](Stream_GetPackage.md) | Function | returns the package the stream was loaded from |
| [`GetPosition`](Stream_GetPosition.md) | Function | returns the current position for read and write operations |
| [`GetSize`](Stream_GetSize.md) | Function | returns the stream size |
| [`Read`](Stream_Read.md) | Function | reads block of data from the stream |
| [`ReadByte`](Stream_ReadByte.md) | Function | reads a byte from the stream |
| [`ReadDouble`](Stream_ReadDouble.md) | Function | reads a double float value from the stream |
| [`ReadFloat`](Stream_ReadFloat.md) | Function | reads a float value from the stream |
| [`ReadInt`](Stream_ReadInt.md) | Function | reads an integer from the stream |
| [`ReadLine`](Stream_ReadLine.md) | Function | reads a line of text |
| [`ReadShort`](Stream_ReadShort.md) | Function | reads an unsigned short from the stream |
| [`ReadString`](Stream_ReadString.md) | Function | reads a string from the stream |
| [`ReadWLine`](Stream_ReadWLine.md) | Function | reads a line of text |
| [`ReadWString`](Stream_ReadWString.md) | Function | reads a wide string from the stream |
| [`Seek`](Stream_Seek.md) | Function | changes the file read position |
| [`Write`](Stream_Write.md) | Function | writes block of data to the stream |
| [`WriteByte`](Stream_WriteByte.md) | Function | writes a byte to the stream |
| [`WriteDouble`](Stream_WriteDouble.md) | Function | writes a double float value to the stream |
| [`WriteFloat`](Stream_WriteFloat.md) | Function | writes a float value to the stream |
| [`WriteInt`](Stream_WriteInt.md) | Function | writes an integer to the stream |
| [`WriteLine`](Stream_WriteLine.md) | Function | writes a line of text |
| [`WriteShort`](Stream_WriteShort.md) | Function | writes an unsigned short to the stream |
| [`WriteString`](Stream_WriteString.md) | Function | writes a string to the stream |
| [`WriteWLine`](Stream_WriteWLine.md) | Function | writes a line of text |
| [`WriteWString`](Stream_WriteWString.md) | Function | writes a wide string to the stream |
| [`OpenFile`](OpenFile) | Function | opens a file for reading and writing |
| [`ReadFile`](ReadFile) | Function | opens a file for reading |
| [`WriteFile`](WriteFile) | Function | opens a file for writing |