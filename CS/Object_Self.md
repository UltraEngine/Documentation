# Object.Self
This is the equivalent to calling the C# **this** keyword inside a class method, except it will return a safe shared pointer.

### Syntax
- `SharedObject<Self>()`

### Return Value
Returns a shared pointer to this object.

### Remarks
This method should *always* be used inside a class method, in place of the C# keyword "this", for all objects created as a shared pointer.

This method should *never* be called in a class constructor or destructor.

You can cast to a derived type using the [Object.As](Object_As.md) method.

## Example ##

```csharp
using UltraEngine;

class MyClass : Object
{
    public string Text;

    static void MyFunc(SharedObject<Object> o)
    {
        Print(o.As<MyClass>().Text);
    }

    void Update()
    {
        //Pass a shared pointer to this object to the function
        MyFunc(Self());
    }
}

void Main()
{
    var o = new SharedObject<MyClass>();
    o.Text = "Hello!";
    o.Update();
}
```