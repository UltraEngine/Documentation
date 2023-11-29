```csharp
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        string path = Path.Combine(Directory.GetDocumentsPath(), "temp.txt");

        //Write a new file
        using (var stream = File.CreateText(path))
        {
            stream.WriteString("Hello, world!");
        }

        using (var stream = File.OpenText(path))
        {
            string content = stream.ReadToEnd();
            Console.WriteLine(content);
        }
    }
}
```