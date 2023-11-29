```C#
using System;
using System.IO;

public class Program
{
    public static void Main()
    {
        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.txt");

        //Write a new file
        using (StreamWriter stream = new StreamWriter(path))
        {
            stream.WriteLine("Hello, world!");
        }

        using (StreamReader stream = new StreamReader(path))
        {
            Console.WriteLine(stream.ReadLine());
        }
    }
}
```