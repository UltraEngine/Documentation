- **Start**(void)

## Example

### C++

```cpp
#include <iostream>
#include <thread>

using namespace std;

void myFunction()
{
    cout << "This is a thread!" << endl;
}

int main()
{
    thread myThread(myFunction);
    myThread.Start();
    myThread.join();

    return 0;
}
```

### C#

```csharp
using System;
using System.Threading;

public class Program
{
    public static void MyFunction()
    {
        Console.WriteLine("This is a thread!");
    }

    public static void Main(string[] args)
    {
        Thread myThread = new Thread(MyFunction);
        myThread.Start();
        myThread.Join();
    }
}
```