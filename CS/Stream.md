# Stream

**Base class:** [Object](Object.md)

This class provides an interface for reading and writing files.

| Property | Type | Description |
| --- | --- | --- |
| path | const [WString](WString.md)& | read-only file name or URL |
| package | const [WString](WString.md)& | read-only file name or URL |
| [Align](Stream_Align.md) | Method | aligns the stream to a multiple of the specified size |
| [Close](Stream_Close.md) | Method | closes the stream |
| [Eof](Stream_Eof.md) | Method | returns true when the end of the stream is reached |
| [Flush](Stream_Flush.md) | Method | flushes the stream |
| [GetPackage](Stream_GetPackage.md) | Method | returns the package the stream was loaded from |
| [GetPosition](Stream_GetPosition.md) | Method | returns the current position for read and write operations |
| [GetSize](Stream_GetSize.md) | Method | returns the stream size |
| [Read](Stream_Read.md) | Method | reads block of data from the stream |
| [ReadByte](Stream_ReadByte.md) | Method | reads a byte from the stream |
| [ReadDouble](Stream_ReadDouble.md) | Method | reads a double float value from the stream |
| [ReadFloat](Stream_ReadFloat.md) | Method | reads a float value from the stream |
| [ReadInt](Stream_ReadInt.md) | Method | reads an integer from the stream |
| [ReadLine](Stream_ReadLine.md) | Method | reads a line of text |
| [ReadShort](Stream_ReadShort.md) | Method | reads an unsigned short from the stream |
| [ReadString](Stream_ReadString.md) | Method | reads a string from the stream |
| [ReadWLine](Stream_ReadWLine.md) | Method | reads a line of text |
| [ReadWString](Stream_ReadWString.md) | Method | reads a wide string from the stream |
| [Seek](Stream_Seek.md) | Method | changes the file read position |
| [Write](Stream_Write.md) | Method | writes block of data to the stream |
| [WriteByte](Stream_WriteByte.md) | Method | writes a byte to the stream |
| [WriteDouble](Stream_WriteDouble.md) | Method | writes a double float value to the stream |
| [WriteFloat](Stream_WriteFloat.md) | Method | writes a float value to the stream |
| [WriteInt](Stream_WriteInt.md) | Method | writes an integer to the stream |
| [WriteLine](Stream_WriteLine.md) | Method | writes a line of text |
| [WriteShort](Stream_WriteShort.md) | Method | writes an unsigned short to the stream |
| [WriteString](Stream_WriteString.md) | Method | writes a string to the stream |
| [WriteWLine](Stream_WriteWLine.md) | Method | writes a line of text |
| [WriteWString](Stream_WriteWString.md) | Method | writes a wide string to the stream |
| [OpenFile](OpenFile) | Function | opens a file for reading and writing |
| [ReadFile](ReadFile) | Function | opens a file for reading |
| [WriteFile](WriteFile) | Function | opens a file for writing |


**Syntax**:

```csharp
public class Stream : Object
{
    public readonly string path;
    public readonly string package;

    public void Align(int size);

    public void Close();

    public bool Eof();

    public void Flush();

    public string GetPackage();

    public long GetPosition();

    public long GetSize();

    public int Read(byte[] buffer, int offset, int count);

    public byte ReadByte();

    public double ReadDouble();

    public float ReadFloat();

    public int ReadInt();

    public string ReadLine();

    public ushort ReadShort();

    public string ReadString();

    public string ReadWLine();

    public string ReadWString();

    public void Seek(long offset, SeekOrigin origin);

    public void Write(byte[] buffer, int offset, int count);

    public void WriteByte(byte value);

    public void WriteDouble(double value);

    public void WriteFloat(float value);

    public void WriteInt(int value);

    public void WriteLine(string value);

    public void WriteShort(ushort value);

    public void WriteString(string value);

    public void WriteWLine(string value);

    public void WriteWString(string value);
}

public Stream OpenFile(string path);

public Stream ReadFile(string path);

public Stream WriteFile(string path);
```

**Example**:

```csharp
// Create a new Stream object
Stream stream = new Stream();

// Open a file for reading and writing
stream = OpenFile("file.txt");

// Read a line of text from the stream
string line = stream.ReadLine();

// Write a line of text to the stream
stream.WriteLine("Hello, World!");

// Close the stream
stream.Close();
```