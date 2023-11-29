# Stream.Seek #
This method sets the stream position for reading or writing.

## Syntax ##
- void **Seek**(ulong pos)

| Parameter | Description |
| --- | --- |
| pos | new position, between zero and the stream size |

## Example

```csharp
using System;
using System.IO;
					
public class Program
{
	public static void Main()
	{
		string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin");

		//Open a stream with read and write permissions
		File.Delete(path);
		var stream = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None);

		//Write some data
		stream.WriteByte(1);
		stream.Write(BitConverter.GetBytes(2.0), 0, sizeof(double));
		stream.Write(BitConverter.GetBytes(3.0f), 0, sizeof(float));
		stream.Write(BitConverter.GetBytes(4), 0, sizeof(int));
		stream.Write(BitConverter.GetBytes((short)5), 0, sizeof(short));

		//Change the stream position
		stream.Seek(0, SeekOrigin.Begin);

		//Read back the data
		Console.WriteLine(stream.ReadByte());
		Console.WriteLine(BitConverter.ToDouble(Read(stream, sizeof(double)), 0));
		Console.WriteLine(BitConverter.ToSingle(Read(stream, sizeof(float)), 0));
		Console.WriteLine(BitConverter.ToInt32(Read(stream, sizeof(int)), 0));
		Console.WriteLine(BitConverter.ToInt16(Read(stream, sizeof(short)), 0));

		//Close the stream
		stream.Close();
	}

	private static byte[] Read(Stream stream, int length)
	{
		byte[] buffer = new byte[length];
		stream.Read(buffer, 0, buffer.Length);
		return buffer;
	}
}
```