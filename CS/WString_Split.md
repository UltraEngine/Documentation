```csharp
using System;
using System.Collections.Generic;

public class Program
{
    public static void Main(string[] args)
    {
        string s = "dog,cat,raccoon,fox,crow,snake,rabbit,deer";
        string[] sarr = s.Split(',');

        foreach (string str in sarr)
        {
            Console.WriteLine(str);
        }
    }
}
```