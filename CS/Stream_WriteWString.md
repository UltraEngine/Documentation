```csharp
using System;
using System.IO;

class Example
{
    static void Main(string[] args)
    {
        string s = "Привет, как ты сегодня? Я в порядке.";

        string path = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/temp.txt";
        using (FileStream stream = new FileStream(path, FileMode.Create))
        {
            stream.WriteByte(255);
            stream.WriteByte(254);
            WriteWString(stream, s, false);
        }

        System.Diagnostics.Process.Start(path);
    }

    static void WriteWString(FileStream stream, string s, bool terminate = true)
    {
        byte[] bytes = System.Text.Encoding.Unicode.GetBytes(s);
        stream.Write(bytes, 0, bytes.Length);
        if (terminate)
        {
            stream.Write(BitConverter.GetBytes((short)0), 0, sizeof(short));
        }
    }
}
```