# Object::Self
This is the equivalent to calling the C++ **this** keyword inside a class method, except it will return a safe shared pointer.

### Syntax
- shared_ptr<[Object](Object.md)\> **Self**()

### Return Value
Returns a shared pointer to this object.

### Remarks
This method should *always* be used inside a class method, in place of the C++ keyword "this", for all objects created as a shared pointer.

This method should *never* be called in a class constructor or destructor.

You can cast to a derived type using the [Object::As](Object_As.md) method.

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

class MyClass : public Object
{
public:
    WString text;

    static void MyFunc(shared_ptr<Object> o)
    {
        Print(o->As<MyClass>()->text);
    }

    void Update()
    {
        //Pass a shared pointer to this object to the function
        MyFunc(Self());
    }
};

int main(int argc, const char* argv[])
{
    auto o = std::make_shared<MyClass>();
    o->text = "Hello!";
    o->Update();
    return 0;
}
```
