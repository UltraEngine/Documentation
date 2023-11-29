```csharp
using System;
using UltraEngine;

//The returned value of the thread entry point will be used as the thread result
public static Object MyFunc(Object o)
{
    return new String("Hello!");
}

public static void Main(string[] args)
{
    Thread thread = CreateThread(MyFunc);
    thread.Resume();
    thread.Wait();
    Object o = thread.GetResult();
    String s = o as String;
    Console.WriteLine(s);

    return;
}
```