```csharp
using System;

namespace UltraEngine
{
    public class WString
    {
        public string ToString() {...}

        public string ToUtf8String() {...}
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            WString ws = "你好，你今天好吗？";
            string s = ws.ToString();

            Console.WriteLine(s);
            if (ws == s)
            {
                Console.WriteLine("Short string matches wide string");
            }
            else
            {
                Console.WriteLine("Short string does not match wide string");
            }

            Console.WriteLine("");

            s = ws.ToUtf8String();

            Console.WriteLine(s);
            if (ws == s)
            {
                Console.WriteLine("Short string matches wide string");
            }
            else
            {
                Console.WriteLine("Short string does not match wide string");
            }
        }
    }
}
```